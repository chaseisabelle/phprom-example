<?php

namespace App\Controller;

use ChaseIsabelle\PHPromBundle\Service\PHPromService;
use Exception;
use Symfony\Component\HttpFoundation\Response;

/**
 * @package App\Controller
 */
class ExampleController
{
    /**
     * @param PHPromService $phpromService
     * @return Response
     * @throws Exception
     */
    public function index(PHPromService $phpromService)
    {
        $code = 200;

        if (!time_nanosleep(rand(0, 10), rand(0, 999) * 1000)) {
            $code = 500;
        }

        if ($code === 200 && rand(1, 10) === 1) {
            $code = 400;
        }

        return new Response('grpc', $code, [
            'Content-Type' => 'text/plain'
        ]);
    }
}
