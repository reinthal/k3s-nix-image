{pkgs, ...}: {
  users.users.kog = {
    hashedPassword = "$y$j9T$dGrTwWw3JWtcSTDXzbVMW/$5jQ35yJGfpw0KX4uzcBmg6qNTtM7fh8keLoatYNql5C";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDG2HQMrYddPMA9CnLIPH4b0Iasg5LkQDW/BNR8wGsbbZ9++v41Tggri5Yq6V5EBcpFVLdEcRgPbRqPk10QLAVXilDBqz6sMUrLyUt5KXhG37X9x4ro0F1/87I0CY3OrDnfm09uclc4tH5gJyeLfiHGOUKZx4malacdWQFCdN7JBHqG0QE++WTilOFerlfQMJULnt75u3zJE5f+IjG7xdjSbx3tr2F7MYMVS21LY1S5UIldl7JHxWz4OaT9CD0+n2t+718tUT7rsLKG34V5yZwMbwOU3D0sjR++umO0hsT4yFRK4/U9Wj17QoLVub14FFUuQDVStuNmr97IgDnn/cSRgStdikksbrQQB0eFmhQf4+hp1uBoTGKE/hgEwG2Bio+xQjCDwLrIgWAUvWiJ7rIbrib3DtchHrK5/MHa09Xfkv692AuhIfmLdxL1FdXCosRf2NOZJ1iQNybqhMgyaifJA7CyIf3/ty0SQMM+Mwt60FDpzGFHrxCx1by7u/gUKV1L97RMekp4pM2Z+Q9fi/ySOurYXW0AsAr1kkCicF4y2MEX/qL1Tse+6ywgACucLGnP/cEvn5YYu8KOcQwZDiKr2YscWH3XOZIE5rqKnXxembEdDh1vNHjL9RQotA7EdZ5C0WbtqYwgVHH1CwlpHtTo1gVN18YIyKl4ZL1pl6DGOw== openpgp:0x9A29FF08"
    ];
    extraGroups = [
      "wheel"
    ];
    packages = with pkgs; [
      zsh
    ];
  };
}
