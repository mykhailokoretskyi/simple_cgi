#!/usr/bin/perl -w

use Request;
use Controller;

my $r = Request->new();
my $m = { request => $r };

my $v = dispatch(request => $r, model => $m);
render(view => $v, model => $m);

sub dispatch {
    my %args = @_;

    # some how we identify controller here
    return Controller->run(
        request => $args{request},
        model => $args{model}
    );
}

sub render {
    my %args = @_;

    print_headers(%args);

    print "VIEW => $args{view}<br/><br/>";
    dump_hash($args{model});
    $args{model}->{request}->dump();
}

sub print_headers {
    print "Content-Type: text/html\n";
    print "\n";
}

sub dump_hash {
    my ($h, $t) = @_;
    $t = 0 unless defined $t;
    map {
        print('&nbsp' x $t);
        print "$_ => ";
        if(!ref($h->{$_})) {
            print $h->{$_} . ",";
        } elsif (ref $h->{$_} eq 'ARRAY') {
            print( '['. join( ', ', @{$h->{$_}} ) .'],');
        } else {
            print "{<br/>";
            dump_hash($h->{$_}, $t+8);
            print( '&nbsp' x $t . "}," );
        }
        print "<br/>";
    } sort keys %$h;
}
