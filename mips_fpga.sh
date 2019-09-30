#Create temp folder
mkdir temp
cd temp

#Get Codescape toolchain Bare Metal
wget https://codescape.mips.com/components/toolchain/2016.05-03/Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Bare.Metal.CentOS-5.x86_64.tar.gz
sudo mkdir /opt/imgtec/
sudo tar xvzf Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Bare.Metal.CentOS-5.x86_64.tar.gz -C /opt/imgtec/

#libfdc Library
sudo mkdir /opt/imgtec/mips-mti-elf/2016.05-03/share/mips/addons/
unzip libfdc.zip -d /opt/imgtec/mips-mti-elf/2016.05-03/share/mips/addons/

#Remove temp folder
#cd ..
#rm -r temp
