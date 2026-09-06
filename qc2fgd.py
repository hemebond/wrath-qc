#
# Original script from Copper Quake mod
#

import os, datetime, sys, glob, argparse, logging
from pathlib import Path

log = logging.getLogger(__name__)
log.setLevel(logging.INFO)

# TODO: put all the baseclasses first

def getQuakeds(qc):
	defOut = ""
	numDefs = 0
	start = 0
	end = 0

	while 1:
		start = qc.find("/*FGD", start)
		if start == -1:
			return defOut, numDefs
		# print( "adding ", qc[start + 9 : qc.find(" ",start + 9)] )
		end = qc.find("*/", start)
		defOut += qc[start + 5: end].strip() + "\n"
		numDefs += 1
		start = end


def get_file_list(file_path):
	log.info(f"Reading {file_path}")
	# load every file listed in progs.src except the header
	with open(file_path, 'r') as progsfile:
		progslines = list(progsfile)[1:]  # first line is output filename, skip it

	qc_files = []
	for line in progslines:
		qcfilename = line.partition("//")[0].strip()
		if (len(qcfilename) < 4):
			continue
		if qcfilename[-3:] != ".qc":
			continue
		qc_files.append(qcfilename)
	return qc_files


def main(out_file, src_file):
	defOut = """// Wrath game definition file (.fgd)
// Generated from Wrath QuakeC source comments on """
	numDefs = 0
	defOut += datetime.datetime.now().strftime("%Y%m%d")
	defOut += "\n"

	# TODO: open quakec in progs.src order for better fgd order control
	qc_files = get_file_list(src_file)
	for qc_file_path in qc_files:
		if not qc_file_path.endswith(".qc"):
			continue

		with open(src_file.parent / qc_file_path, "r") as qc_file:
			qc = qc_file.read()

		defs, n = getQuakeds(qc)
		if (n):
			defOut += "\n//\n// " + qc_file_path + "\n//\n"
			defOut += defs
			numDefs += n
			defOut += "\n"

	log.info(f"Writing to {out_file}")
	with open(out_file, "w") as df:
		df.write(defOut)
	log.info(f"Completed, found {numDefs}")


def src_file(path):
	if not os.path.exists(path):
		raise argparse.ArgumentTypeError("progs.src file {0} not found".format(path))
	return path

if __name__ == "__main__":
	logging.basicConfig(level=logging.INFO)

	parser = argparse.ArgumentParser()
	parser.add_argument("name", default="wrath")
	parser.add_argument("--srcfile", type=src_file, default="progs.src")
	args = parser.parse_args()

	src_file = Path(args.srcfile)
	out_file = Path(args.name + '.fgd')

	main(out_file=out_file, src_file=src_file)
