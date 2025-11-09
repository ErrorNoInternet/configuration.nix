use strict;
use Irssi;
use Irssi::TextUI;

sub cmd_extrabuster ($$$) {
    my ($args, $server, $witem) = @_;
    my $limit = $args =~ /^\d+$/ ? $args : -1;
    my $win = ref $witem ? $witem->window() : Irssi::active_win();
    my $view = $win->view;
    my $line = $view->get_lines;
    $line = $line->next while defined $line->next;
    while (defined $line->prev) {
        last if $limit == 0;
        my $level = $line->{info}{level};
        my $copy = $line;
        $line = $line->prev;
        next unless ($copy->get_text(1) =~ /\*buffextras/);
        $view->remove_line($copy);
        $limit-- if $limit;
    }
    $view->redraw();
}

Irssi::command_bind('extrabuster', \&cmd_extrabuster);
