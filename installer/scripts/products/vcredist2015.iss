// requires Windows 10, Windows 7 Service Pack 1, Windows 8, Windows 8.1, Windows Server 2003 Service Pack 2, Windows Server 2008 R2 SP1, Windows Server 2008 Service Pack 2, Windows Server 2012, Windows Vista Service Pack 2, Windows XP Service Pack 3
// http://www.microsoft.com/en-US/download/details.aspx?id=48145

[CustomMessages]
vcredist2015_title=Visual C++ 2015 Update 3 Redistributable
vcredist2015_title_x64=Visual C++ 2015 Update 3 64-Bit Redistributable

en.vcredist2015_size=13.8 MB

en.vcredist2015_size_x64=14.6 MB


[Code]
const
	vcredist2015_url = 'http://download.microsoft.com/download/9/a/2/9a2a7e36-a8af-46c0-8a78-a5eb111eefe2/vc_redist.x86.exe';
	vcredist2015_url_x64 = 'http://download.microsoft.com/download/2/a/2/2a2ef9ab-1b4b-49f0-9131-d33f79544e70/vc_redist.x64.exe';

	vcredist2015_productcode = '{844ECB74-9B63-3D5C-958C-30BD23F19EE4}';
	vcredist2015_productcode_x64 = '{F20396E5-D84E-3505-A7A8-7358F0155F6C}';

procedure vcredist2015();
begin
	if (not IsIA64()) then begin
		if (not msiproduct(GetString(vcredist2015_productcode, vcredist2015_productcode_x64, ''))) then
			AddProduct('vcredist2015' + GetArchitectureString() + '.exe',
				'/passive /norestart',
				CustomMessage('vcredist2015_title' + GetArchitectureString()),
				CustomMessage('vcredist2015_size' + GetArchitectureString()),
				GetString(vcredist2015_url, vcredist2015_url_x64, ''),
				false, false);
	end;
end;
