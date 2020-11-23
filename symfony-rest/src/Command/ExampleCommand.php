<?php

namespace App\Command;

use ChaseIsabelle\PHPromBundle\Service\PHPromService;
use PHProm\Timer;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class ExampleCommand extends Command
{
    protected static $defaultName = 'example';

    protected $phpromService;

    public function __construct(string $name = null, PHPromService $phpromService)
    {
        parent::__construct($name);

        $this->phpromService = $phpromService;
    }

    public function execute(InputInterface $input, OutputInterface $output)
    {
        $histogram = $this->phpromService->histogram()
            ->setName('command_latency_seconds')
            ->setDescription('')
            ->setLabels(['status']);

        $timer = (new Timer($histogram))
            ->start();

        $response = file_get_contents('http://symfony');
        $success  = is_string($response);
        $status   = $success ? 'success' : 'failure';

        $timer->stop()->record(['status' => $status]);

        $output->write($success ? $response : 'failed to query myself');

        return 0;
    }
}
