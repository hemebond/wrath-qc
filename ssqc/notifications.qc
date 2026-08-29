.float fullitemtime;


void Hud_SendNotification_Full(entity ownr, string icon, string label, string msg, float msgflags = 0) {
	msg_entity = ownr;
	WriteByte(MSG_ONE, SVC_TEMPENTITY);
	WriteByte(MSG_ONE, TEMPENT::NOTIFICATION);
	WriteByte(MSG_ONE, msgflags);
	WriteString(MSG_ONE, icon);
	WriteString(MSG_ONE, label);
	WriteString(MSG_ONE, msg);
}


void Hud_SendNotification(entity ownr, string icon, string msg, float msgflags = 0) {
	Hud_SendNotification_Full(ownr, icon, icon, msg, msgflags);
}


void Hud_SendNotification_Note(entity ownr, string icon, float note) {
	msg_entity = ownr;
	WriteByte(MSG_ONE, SVC_TEMPENTITY);
	WriteByte(MSG_ONE, TEMPENT::NOTIFICATION_NOTE);
	WriteString(MSG_ONE, icon);
	WriteByte(MSG_ONE, note);
}


void Hud_SendNotification_Control(entity ownr, string format, string cmd) {
	msg_entity = ownr;
	WriteByte(MSG_ONE, SVC_TEMPENTITY);
	WriteByte(MSG_ONE, TEMPENT::NOTIFICATION_CONTROL);
	WriteByte(MSG_ONE, 0);
	WriteString(MSG_ONE, format);
	WriteString(MSG_ONE, cmd);
}


void Hud_SendNotification_Control2(entity ownr, string format, string cmd, string cmd2) {
	msg_entity = ownr;
	WriteByte(MSG_ONE, SVC_TEMPENTITY);
	WriteByte(MSG_ONE, TEMPENT::NOTIFICATION_CONTROL);
	WriteByte(MSG_ONE, 1);
	WriteString(MSG_ONE, format);
	WriteString(MSG_ONE, cmd);
	WriteString(MSG_ONE, cmd2);
}


void Hud_CantUseSigilNotification(entity ownr) {
	if(ownr.time_hudmessage < time) {
		stuffcmd (ownr, "bf 0 0 0 0.75 1.5\n");
		sound7(self,CHAN_AUTO,"enemies/keeper/shield_ricochet2.ogg",0.75,0.25,120,0);
		Hud_SendNotification_Full(ownr, "full", "cannotuse_sigils", ("$NOTIFY_CANTUSE_SIGILS"), 0);
		ownr.time_hudmessage = time + 1;
	}
}

void Hud_CantUseArtifactNotification(entity ownr)
{
	if(ownr.time_hudmessage < time)
	{
		stuffcmd (ownr, "bf 0 0 0 0.75 1.5\n");
		sound7(self,CHAN_AUTO,"enemies/keeper/shield_ricochet2.ogg",0.75,0.25,120,0);
		Hud_SendNotification_Full(ownr, "full", "cannotuse_artifacts", ("$NOTIFY_CANTUSE_ARTIFACTS"), 0);
		ownr.time_hudmessage = time + 2;
	}
}

void Hud_CantUseNotification(entity ownr)
{
	if(ownr.time_hudmessage < time)
	{
		stuffcmd (ownr, "bf 0 0 0 0.75 1.5\n");
		sound7(self,CHAN_AUTO,"enemies/keeper/shield_ricochet2.ogg",0.75,0.25,120,0);
		Hud_SendNotification_Full(ownr, "full", "cantuse", ("$NOTIFY_CANTUSE"), 0);
		ownr.time_hudmessage = time + 2;
	}
}

void Hud_FullNotification(entity ownr)
{
	Hud_SendNotification(ownr, "full", "$NOTIFY_FULL");
}

void Hud_JournalNotification(entity ownr)
{
	Hud_SendNotification(ownr, "journal_update", ("$NOTIFY_JOURNALUPDATED"));
}

void Hud_message(float mtype, vector org, entity ownr) {
	if(!(ownr.flags & FL_CLIENT))
		return;

	if (ownr.classname != "player")
		return;

	Hud_SendNotification(ownr, "gfx/hud/messages/icons/msgicon_full", "Placeholder");
}
