#!/bin/sh


OUTDIR=`pwd`/OUT
INDIR=data

mkdir -p $OUTDIR


./multi_spec \
  infile=$INDIR/four+rot.map \
  evtfile=$INDIR/acisf09399_repro_evt2.fits \
  outroot=$OUTDIR/multi_spec_single_arf \
  srcmodel="xsphabs.absrb*xsapec.thrm" \
  init="group_counts(5);set_method('levmar');absrb.nH = 0.0494;thrm.kT = 0.9;thrm.kT.max = 5;thrm.redshift = 0.009;freeze(absrb.nH) " \
  conclusion="conf();errs=get_conf_results();kT_lo=errs.parmins[0];kT_lo=np.nan if kT_lo is None else float(kT_lo);kT_hi=errs.parmaxes[0];kT_hi=np.nan if kT_hi is None else float(kT_hi)" \
  return_value="thrm.kT.val,get_fit_results().rstat,kT_lo,kT_hi" \
  arffile=$INDIR/arf.fits \
  rmffile=$INDIR/rmf.fits \
  mode=h clob+ verb=2


./multi_spec \
  infile=$INDIR/four+rot.map \
  evtfile=$INDIR/acisf09399_repro_evt2.fits \
  outroot=$OUTDIR/multi_spec_many_arf \
  srcmodel="xsphabs.absrb*xsapec.thrm" \
  init="group_counts(5);set_method('levmar');absrb.nH = 0.0494;thrm.kT = 0.9;thrm.kT.max = 5;thrm.redshift = 0.009;freeze(absrb.nH) " \
  conclusion="conf();errs=get_conf_results();kT_lo=errs.parmins[0];kT_lo=np.nan if kT_lo is None else float(kT_lo);kT_hi=errs.parmaxes[0];kT_hi=np.nan if kT_hi is None else float(kT_hi)" \
  return_value="thrm.kT.val,get_fit_results().rstat,kT_lo,kT_hi" \
  arffile=$INDIR/arfs/out \
  rmffile=$INDIR/rmf.fits \
  mode=h clob+ verb=2
  





