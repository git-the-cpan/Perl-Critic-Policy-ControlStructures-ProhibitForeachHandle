use strict;
use warnings;

use 5.006001;

use lib qw{ inc };

use ExtUtils::MakeMaker;
use My::Module::Meta qw{
    build_required_module_versions
    required_module_versions
    required_perl_version
    recommended_module_versions
};

( my $mmv = ExtUtils::MakeMaker->VERSION ) =~ s/_//g;

my %args = (
    NAME            => 'Perl::Critic::Policy::ControlStructures::ProhibitForeachHandle',
    VERSION_FROM    => 'lib/Perl/Critic/Policy/ControlStructures/ProhibitForeachHandle.pm',
    PREREQ_PM       => { required_module_versions() },
    PL_FILES        => {},        # Prevent old MakeMaker from running Build.PL
    AUTHOR          => 'Tom Wyant (wyant at cpan dot org)',
    ABSTRACT        => q/Critique 'for ( <fubar> ) {...}' and friends/,
);

$mmv >= 6.31
    and $args{LICENSE} = 'perl';

if ( $mmv >= 6.4501 ) {
    $args{META_ADD} = {
        no_index    => {
            directory   => [ qw{ inc t xt } ],
        },
    };
    $args{META_MERGE} = {
        resources   => {
            bugtracker  => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Astro-UTDF',
            license     => 'http://dev.perl.org/licenses/',
        },
    };
}

$mmv >= 6.4701
    and $args{MIN_PERL_VERSION} = required_perl_version();

$mmv >= 6.5501
    and $args{BUILD_REQUIRES} = { build_required_module_versions() }
    or $mmv >= 6.4501
    and $args{META_MERGE}{build_requires} = { build_required_module_versions() };

WriteMakefile( %args );

##############################################################################
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab shiftround :
