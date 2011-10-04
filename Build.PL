#!/usr/bin/perl

use strict;
use warnings;

use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Application',
    license             => 'perl',
    dist_author         => 'Matthew Callaway <mcallawa@genome.wustl.edu>',
    dist_version        => 0.01,
    dist_abstract       => 'A basic perl application',
    build_requires => {
        'Test::More' => '0.10',
    },
);

$builder->create_build_script();

