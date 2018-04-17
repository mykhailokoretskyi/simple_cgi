package Request;

sub new {
    bless {}, shift;
};

sub dump {
    print "<br/>";
    map {
        print "$_ = $ENV{$_}<br/>";
    } sort keys %ENV;
}

sub q_param {
    my ($self, $name) = @_;
    $ENV{QUERY_STRING} =~ /$name=([^&]+)/;
    return $1;
}

1;
