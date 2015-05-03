mono ./src/.nuget/NuGet.exe install nunit.runners -Version 2.6.4 -OutputDirectory ./nuget-packages
runTest(){
	mono ./nuget-packages/NUnit.Runners.2.6.4/tools/nunit-console.exe -noxml -nodots -labels -stoponerror $@
	if [ $? -ne 0 ]
	then
		exit 1
	fi
}

runTest $1 -exclude=Integration,Performance
exit $?
