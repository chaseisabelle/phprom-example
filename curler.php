<?php
set_error_handler(function ($code, $message, $file, $line) {
    die("$file:$line $message\n");
}, E_ALL | E_NOTICE | E_WARNING);

while (true) {
    $suffix = 'grpc';

    if (rand(0, 1)) {
        $suffix = 'rest:8080';
    }

    file_get_contents("http://symfony-$suffix");
}
