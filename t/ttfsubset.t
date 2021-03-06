#!/usr/bin/perl

use Test::Simple tests => 2;
use File::Compare;

$ttfsubset = "scripts/ttfsubset";

if (!-f $ttfsubset)
{
    $ttfsubset = "/usr/bin/ttfsubset";
}

$res = system($^X, $ttfsubset, '-g', 't/subset.cfg', '-n', 'Subset', 't/testfont.ttf', 't/subset.ttf');
ok (!($res>>8), "exit code");
$res = compare("t/subset.ttf", "t/base/subset.ttf");
ok(!$res, "compiled.ttf");
unlink "t/subset.ttf" unless ($res);
