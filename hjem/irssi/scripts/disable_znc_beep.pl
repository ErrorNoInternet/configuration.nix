use strict;
use Irssi;

Irssi::signal_add('channel sync', sub {
    Irssi::settings_set_str("beep_msg_level", "MSGS DCC DCCMSGS HILIGHT NOTICES");
});
