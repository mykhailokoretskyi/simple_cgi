package EDPModel;

sub load {
    my ($class, %args) = @_;
    return {
        id => $args{id},
        name => "Test event",
        venue => {
            id => 1,
            name => 'Madison Square Garden',
            promoters => [ 123, 234, 345 ],
        },
    };
}

1;
