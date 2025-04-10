{
  buildDunePackage,
  ocaml_pcre,
  mparser,
}:

buildDunePackage {
  pname = "mparser-pcre";
  useDune2 = true;

  inherit (mparser) src version;

  propagatedBuildInputs = [
    ocaml_pcre
    mparser
  ];

  meta = mparser.meta // {
    description = "PCRE-based regular expressions";
  };
}
