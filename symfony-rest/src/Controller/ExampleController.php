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
        $counter = $phpromService->counter()
            ->setName('custom_counter')
            ->setDescription('my custom counter')
            ->setLabels(['foo']); //<< optional

        $counter->record(
            rand(1, 10),
            ['foo' => 'bar'] //<< optional
        );

        $histogram = $phpromService->histogram()
            ->setName('custom_histogram')
            ->setDescription('my custom histogram')
            ->setLabels(['foo']) //<< optional
            ->setBuckets(range(1, 10)); //<< optional

        $histogram->record(
            rand(1, 100) / 10,
            ['foo' => 'bar'] //<< optional
        );

        $summary = $phpromService->summary()
            ->setName('custom_summary')
            ->setDescription('my custom summary')
            ->setLabels(['foo']) //<< optional
            ->setObjectives(range(1, 5)) //<< optional
            ->setAgeBuckets(5) //<< optional
            ->setMaxAge(10)    //<< optional
            ->setBufCap(5); //<< optional

        $summary->record(
            rand(1, 100) / 10,
            ['foo' => 'bar'] //<< optional
        );

        $gauge = $phpromService->gauge()
            ->setName('custom_gauge')
            ->setDescription('my custom gauge')
            ->setLabels(['foo']); //<< optional

        $gauge->record(
            rand(1, 10),
            ['foo' => 'bar'] //<< optional
        );

        return new Response($phpromService->instance()->get(), 200, [
            'Content-Type' => 'text/plain'
        ]);
    }
}
