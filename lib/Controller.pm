package Controller;

use EDPModel;

sub run {
    my ($class, %args) = @_;

    my $id = $args{request}->q_param('event_id');
    $args{model}->{edp} = EDPModel->load(id => $id);

    return "user";
}

1;
