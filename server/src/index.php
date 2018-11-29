<?php

use Slim\Http\Request;
use Slim\Http\Response;

require __DIR__ . '/../../vendor/autoload.php';

$app = new \Slim\App;

$app->get('/', function (Request $request, Response $response, array $args) {
    $response->getBody()->write("Hello World!");

    return $response;
});

$app->run();