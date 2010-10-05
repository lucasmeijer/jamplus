open(MYFILE,">built_by_teamcity.txt");
print MYFILE "These builds were created by teamcity from vcs number: $ENV{BUILD_VCS_NUMBER}\n";
print MYFILE "TC projectname was: $ENV{TEAMCITY_PROJECT_NAME}\n";
print MYFILE "TC buildconfigname was: $ENV{TEAMCITY_BUILDCONF_NAME}\n";
close(MYFILE);

system("chmod +x bin/macosxx86/*");
system("chmod +x bin/macosxx64/*");
system("chmod +x bin/linuxx86/*");
system("chmod +x bin/macosxx86/lua/lua");
system("chmod +x bin/macosxx64/lua/lua");
system("chmod +x bin/linuxx86/lua/lua");

system("zip -r builds.zip *") eq 0 or die("failed zipping up builds");
