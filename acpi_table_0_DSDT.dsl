/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of acpi_table_0_DSDT.aml
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0001EE6A (126570)
 *     Revision         0x02
 *     Checksum         0xEE
 *     OEM ID           "ALASKA"
 *     OEM Table ID     "A M I "
 *     OEM Revision     0x01072009 (17244169)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160422 (538313762)
 */
DefinitionBlock ("", "DSDT", 2, "ALASKA", "A M I ", 0x01072009)
{
    External (0___, UnknownObj)
    External (____, UnknownObj)
    External (_GPE.AL6F, MethodObj)    // 0 Arguments
    External (_GPE.HLVT, MethodObj)    // 0 Arguments
    External (_PR_.BGIA, UnknownObj)
    External (_PR_.BGMA, UnknownObj)
    External (_PR_.BGMS, UnknownObj)
    External (_PR_.CFGD, UnknownObj)
    External (_PR_.CPPC, IntObj)
    External (_PR_.DSAE, UnknownObj)
    External (_PR_.DTS1, UnknownObj)
    External (_PR_.DTS2, UnknownObj)
    External (_PR_.DTS3, UnknownObj)
    External (_PR_.DTS4, UnknownObj)
    External (_PR_.DTSE, UnknownObj)
    External (_PR_.DTSF, UnknownObj)
    External (_PR_.DTSI, IntObj)
    External (_PR_.ELNG, UnknownObj)
    External (_PR_.EMNA, UnknownObj)
    External (_PR_.EPCS, UnknownObj)
    External (_PR_.HWPI, IntObj)
    External (_PR_.PDTS, UnknownObj)
    External (_PR_.PKGA, UnknownObj)
    External (_PR_.POWS, UnknownObj)
    External (_PR_.PR00, DeviceObj)
    External (_PR_.PR00._PPC, MethodObj)    // 0 Arguments
    External (_PR_.PR00._PSS, MethodObj)    // 0 Arguments
    External (_PR_.PR00.TPSS, PkgObj)
    External (_PR_.TRPD, UnknownObj)
    External (_PR_.TRPF, UnknownObj)
    External (_SB_.IETM, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.CDDS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.GFX0.CEVT, UnknownObj)
    External (_SB_.PCI0.GFX0.CLID, UnknownObj)
    External (_SB_.PCI0.GFX0.CSTS, UnknownObj)
    External (_SB_.PCI0.GFX0.DD1F, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.GSCI, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.GSSE, UnknownObj)
    External (_SB_.PCI0.GFX0.LCD0, DeviceObj)
    External (_SB_.PCI0.GFX0.PDDS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.GFX0.STAT, UnknownObj)
    External (_SB_.PCI0.GFX0.TCHE, UnknownObj)
    External (_SB_.PCI0.HDAS.PPMS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.HDAS.PS0X, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.HDAS.PS3X, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.HIDW, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.HIWC, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.ISP0, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.XDAT, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.HPME, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG0.PEGP.LCD0, UnknownObj)
    External (_SB_.PCI0.PEG1.HPME, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.PEG2.HPME, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.RP05.PWRG, UnknownObj)
    External (_SB_.PCI0.RP05.RSTG, UnknownObj)
    External (_SB_.PCI0.RP05.SCLK, UnknownObj)
    External (_SB_.PCI0.RP09.PWRG, UnknownObj)
    External (_SB_.PCI0.RP09.RSTG, UnknownObj)
    External (_SB_.PCI0.RP09.SCLK, UnknownObj)
    External (_SB_.PCI0.RP13.PWRG, UnknownObj)
    External (_SB_.PCI0.RP13.RSTG, UnknownObj)
    External (_SB_.PCI0.RP13.SCLK, UnknownObj)
    External (_SB_.PCI0.RP17.PWRG, UnknownObj)
    External (_SB_.PCI0.RP17.RSTG, UnknownObj)
    External (_SB_.PCI0.RP17.SCLK, UnknownObj)
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.XHC_.PS0X, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.PS3X, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.INIR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.PS0X, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.PS2X, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.XHC_.RHUB.PS3X, MethodObj)    // 0 Arguments
    External (_SB_.TPM_.PTS_, MethodObj)    // 1 Arguments
    External (BNUM, UnknownObj)    // Conflicts with a later declaration
    External (CRBI, UnknownObj)
    External (GSMI, UnknownObj)
    External (LIDS, UnknownObj)
    External (M32B, UnknownObj)
    External (M32L, UnknownObj)
    External (M64B, UnknownObj)
    External (M64L, UnknownObj)
    External (MDBG, MethodObj)    // 1 Arguments
    External (PC00, IntObj)
    External (PC01, UnknownObj)
    External (PC02, UnknownObj)
    External (PC03, UnknownObj)
    External (PC04, UnknownObj)
    External (PC05, UnknownObj)
    External (PC06, UnknownObj)
    External (PC07, UnknownObj)
    External (PC08, UnknownObj)
    External (PC09, UnknownObj)
    External (PC10, UnknownObj)
    External (PC11, UnknownObj)
    External (PC12, UnknownObj)
    External (PC13, UnknownObj)
    External (PC14, UnknownObj)
    External (PC15, UnknownObj)
    External (RP05.PWRG, UnknownObj)
    External (RP05.RSTG, UnknownObj)
    External (RP05.SCLK, UnknownObj)
    External (RP09.PWRG, UnknownObj)
    External (RP09.RSTG, UnknownObj)
    External (RP09.SCLK, UnknownObj)
    External (RP13.PWRG, UnknownObj)
    External (RP13.RSTG, UnknownObj)
    External (RP13.SCLK, UnknownObj)
    External (RP17.PWRG, UnknownObj)
    External (RP17.RSTG, UnknownObj)
    External (RP17.SCLK, UnknownObj)
    External (SAT0.NVM1.VLPM, UnknownObj)
    External (SAT0.NVM2.VLPM, UnknownObj)
    External (SAT0.NVM3.VLPM, UnknownObj)
    External (SGMD, UnknownObj)

    Name (PEBS, 0xE0000000)
    Name (PELN, 0x10000000)
    Name (MCHB, 0xFED10000)
    Name (MCHL, 0x8000)
    Name (EGPB, 0xFED19000)
    Name (EGPL, 0x1000)
    Name (DMIB, 0xFED18000)
    Name (DMIL, 0x1000)
    Name (VTBS, 0xFED90000)
    Name (VTLN, 0x4000)
    Name (CPVD, Zero)
    Name (SMIP, 0xB2)
    Name (PMBA, 0x1800)
    Name (SMCR, 0x1830)
    Name (TCBR, 0xFED08000)
    Name (TCLT, 0x1000)
    Name (SMBL, 0x20)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (FMBL, One)
    Name (FDTP, 0x02)
    Name (FUPS, 0x04)
    Name (FUWS, 0x03)
    Name (FEMD, 0x04)
    Name (PFTU, 0xB2)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, Zero)
    Name (SHPC, One)
    Name (PEPM, Zero)
    Name (PEER, Zero)
    Name (PECS, Zero)
    Name (ITKE, Zero)
    Name (MBEC, 0xFFFF)
    Name (CSMI, 0x61)
    Name (DSSP, Zero)
    Name (FHPP, One)
    Name (SMIA, 0xB2)
    Name (SMIB, 0xB3)
    Name (OFST, 0x35)
    Name (TRST, 0x02)
    Name (TCMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (TTPF, One)
    Name (DTPT, Zero)
    Name (TTDP, Zero)
    Name (TPMB, 0xFFFFFFFF)
    Name (TPMC, 0xFFFFFFFF)
    Name (TPMM, 0xFED40000)
    Name (FTPM, 0xFFFFFFFF)
    Name (PPIM, 0xFFFF0000)
    Name (PPIL, 0xF0)
    Name (AMDT, Zero)
    Name (TPMF, Zero)
    Name (PPIV, Zero)
    Name (SS1, One)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, 0xFFFF)
    Name (TOPM, 0x000FFFFF)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    OperationRegion (GNVS, SystemMemory, 0xFFFF0000, 0xAA55)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        PWRS,   8, 
        DBGS,   8, 
        THOF,   8, 
        ACT1,   8, 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        Offset (0x1E), 
        BNUM,   8, 
        Offset (0x20), 
        Offset (0x21), 
        Offset (0x22), 
        Offset (0x23), 
        Offset (0x24), 
        Offset (0x25), 
        REVN,   8, 
        APIC,   8, 
        TCNT,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        C67L,   8, 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
        SMSC,   8, 
        W381,   8, 
        SMC1,   8, 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
        MEFE,   8, 
        DSTS,   8, 
        MORD,   8, 
        TCGP,   8, 
        PPRP,   32, 
        PPRQ,   8, 
        LPPR,   8, 
        IDEM,   8, 
        PLID,   8, 
        BTYP,   8, 
        OSCC,   8, 
        NEXP,   8, 
        SBV1,   8, 
        SBV2,   8, 
        ECON,   8, 
        DSEN,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        VFN2,   8, 
        VFN3,   8, 
        VFN4,   8, 
        VFN5,   8, 
        VFN6,   8, 
        VFN7,   8, 
        VFN8,   8, 
        VFN9,   8, 
        ATMC,   8, 
        PTMC,   8, 
        PNHM,   32, 
        TBAL,   32, 
        TBAH,   32, 
        RTIP,   8, 
        TSOD,   8, 
        PFLV,   8, 
        BREV,   8, 
        PDTS,   8, 
        PKGA,   8, 
        PAMT,   8, 
        AC0F,   8, 
        AC1F,   8, 
        DTS3,   8, 
        DTS4,   8, 
        LTR1,   8, 
        LTR2,   8, 
        LTR3,   8, 
        LTR4,   8, 
        LTR5,   8, 
        LTR6,   8, 
        LTR7,   8, 
        LTR8,   8, 
        LTR9,   8, 
        LTRA,   8, 
        LTRB,   8, 
        LTRC,   8, 
        LTRD,   8, 
        LTRE,   8, 
        LTRF,   8, 
        LTRG,   8, 
        LTRH,   8, 
        LTRI,   8, 
        LTRJ,   8, 
        LTRK,   8, 
        LTRL,   8, 
        LTRM,   8, 
        LTRN,   8, 
        LTRO,   8, 
        OBF1,   8, 
        OBF2,   8, 
        OBF3,   8, 
        OBF4,   8, 
        OBF5,   8, 
        OBF6,   8, 
        OBF7,   8, 
        OBF8,   8, 
        OBF9,   8, 
        OBFA,   8, 
        OBFB,   8, 
        OBFC,   8, 
        OBFD,   8, 
        OBFE,   8, 
        OBFF,   8, 
        OBFG,   8, 
        OBFH,   8, 
        OBFI,   8, 
        OBFJ,   8, 
        OBFK,   8, 
        OBFL,   8, 
        OBFM,   8, 
        OBFN,   8, 
        OBFO,   8, 
        XTUB,   32, 
        XTUS,   32, 
        XMPB,   32, 
        DDRF,   8, 
        RTD3,   8, 
        PEP0,   8, 
        PEP3,   8, 
        DPTF,   8, 
        DCFE,   16, 
        SADE,   8, 
        SACR,   8, 
        SAHT,   8, 
        CPUS,   8, 
        CTDP,   8, 
        LPMP,   8, 
        LPMV,   8, 
        ECEU,   8, 
        TGFG,   16, 
        MEMD,   8, 
        ATRA,   8, 
        PTRA,   8, 
        MEMC,   8, 
        MEMH,   8, 
        FND1,   8, 
        FND2,   8, 
        AMBD,   8, 
        AMAT,   8, 
        AMPT,   8, 
        AMCT,   8, 
        AMHT,   8, 
        SKDE,   8, 
        SKAT,   8, 
        SKPT,   8, 
        SKCT,   8, 
        SKHT,   8, 
        EFDE,   8, 
        EFAT,   8, 
        EFPT,   8, 
        EFCT,   8, 
        EFHT,   8, 
        VRDE,   8, 
        VRAT,   8, 
        VRPT,   8, 
        VRCT,   8, 
        VRHT,   8, 
        DPAP,   8, 
        DPPP,   8, 
        DPCP,   8, 
        DCMP,   8, 
        TRTV,   8, 
        LPOE,   8, 
        LPOP,   8, 
        LPOS,   8, 
        LPOW,   8, 
        LPER,   8, 
        PPSZ,   32, 
        DISE,   8, 
        BGMA,   64, 
        BGMS,   8, 
        BGIA,   16, 
        IRMC,   8, 
        NFCE,   8, 
        CHEN,   8, 
        S0ID,   8, 
        CTDB,   8, 
        DKSM,   8, 
        SIO1,   16, 
        SIO2,   16, 
        SPBA,   16, 
        SEC0,   32, 
        SEC1,   32, 
        SEC2,   32, 
        SEC3,   32, 
        SEC4,   32, 
        SEC5,   32, 
        SEC6,   32, 
        SEC7,   32, 
        SEC8,   32, 
        Offset (0x1F4), 
        WIFD,   8, 
        WFAT,   8, 
        WFPT,   8, 
        WFCT,   8, 
        WFHT,   8, 
        PWRE,   8, 
        Offset (0x1FC), 
        PPPR,   16, 
        PBPE,   8, 
        VSPE,   8, 
        Offset (0x203), 
        XHPR,   8, 
        RIC0,   8, 
        GBSX,   8, 
        IUBE,   8, 
        IUCE,   8, 
        IUDE,   8, 
        ECNO,   8, 
        AUDD,   16, 
        IC0D,   16, 
        IC1D,   16, 
        IC1S,   16, 
        VRRD,   16, 
        PSCP,   8, 
        I20D,   16, 
        I21D,   16, 
        RCG0,   16, 
        RCG1,   16, 
        ECDB,   8, 
        P2ME,   8, 
        P2MK,   8, 
        SSH0,   16, 
        SSL0,   16, 
        SSD0,   16, 
        FMH0,   16, 
        FML0,   16, 
        FMD0,   16, 
        FPH0,   16, 
        FPL0,   16, 
        FPD0,   16, 
        SSH1,   16, 
        SSL1,   16, 
        SSD1,   16, 
        FMH1,   16, 
        FML1,   16, 
        FMD1,   16, 
        FPH1,   16, 
        FPL1,   16, 
        FPD1,   16, 
        M0C0,   16, 
        M1C0,   16, 
        M2C0,   16, 
        M0C1,   16, 
        M1C1,   16, 
        M2C1,   16, 
        M0C2,   16, 
        M1C2,   16, 
        M0C3,   16, 
        M1C3,   16, 
        M0C4,   16, 
        M1C4,   16, 
        M0C5,   16, 
        M1C5,   16, 
        TBSF,   8, 
        GIRQ,   32, 
        DMTP,   8, 
        DMTD,   8, 
        DMSH,   8, 
        SHSB,   8, 
        PLCS,   8, 
        PLVL,   16, 
        GN1E,   8, 
        G1AT,   8, 
        G1PT,   8, 
        G1CT,   8, 
        G1HT,   8, 
        GN2E,   8, 
        G2AT,   8, 
        G2PT,   8, 
        G2CT,   8, 
        G2HT,   8, 
        WWSD,   8, 
        CVSD,   8, 
        SSDD,   8, 
        INLD,   8, 
        IFAT,   8, 
        IFPT,   8, 
        IFCT,   8, 
        IFHT,   8, 
        SDWE,   8, 
        USBH,   8, 
        BCV4,   8, 
        WTV0,   8, 
        WTV1,   8, 
        APFU,   8, 
        SOHP,   8, 
        GP5F,   8, 
        NOHP,   8, 
        TBSE,   8, 
        WKFN,   8, 
        PEPC,   32, 
        VRSD,   16, 
        PB1E,   8, 
        GNID,   8, 
        WAND,   8, 
        WWAT,   8, 
        WWPT,   8, 
        WWCT,   8, 
        WWHT,   8, 
        Offset (0x2A3), 
        MPL0,   16, 
        CHGE,   8, 
        SAC3,   8, 
        MEM3,   8, 
        AMC3,   8, 
        SKC3,   8, 
        EFC3,   8, 
        VRC3,   8, 
        WFC3,   8, 
        G1C3,   8, 
        G2C3,   8, 
        IFC3,   8, 
        WWC3,   8, 
        WGC3,   8, 
        SPST,   8, 
        PERE,   8, 
        PEAT,   8, 
        PEPV,   8, 
        PECR,   8, 
        PEC3,   8, 
        PEHT,   8, 
        GN3E,   8, 
        G3AT,   8, 
        G3PT,   8, 
        G3CT,   8, 
        G3HT,   8, 
        GN4E,   8, 
        G4AT,   8, 
        G4PT,   8, 
        G4CT,   8, 
        G4HT,   8, 
        GN5E,   8, 
        G5AT,   8, 
        G5PT,   8, 
        G5CT,   8, 
        G5HT,   8, 
        GN6E,   8, 
        G6AT,   8, 
        G6PT,   8, 
        G6CT,   8, 
        G6HT,   8, 
        ECLP,   8, 
        G3C3,   8, 
        G4C3,   8, 
        G5C3,   8, 
        G6C3,   8, 
        TSP1,   8, 
        TSP2,   8, 
        TSP3,   8, 
        TSP4,   8, 
        TSP5,   8, 
        TSP6,   8, 
        TSP7,   8, 
        TSP8,   8, 
        SSP1,   8, 
        SSP2,   8, 
        SSP3,   8, 
        SSP4,   8, 
        SSP5,   8, 
        SSP6,   8, 
        SSP7,   8, 
        SSP8,   8, 
        MEMS,   8, 
        STGE,   8, 
        STAT,   8, 
        STPT,   8, 
        STCT,   8, 
        STC3,   8, 
        STHT,   8, 
        VSP1,   8, 
        V1AT,   8, 
        V1PV,   8, 
        V1CR,   8, 
        V1C3,   8, 
        V1HT,   8, 
        VSP2,   8, 
        V2AT,   8, 
        V2PV,   8, 
        V2CR,   8, 
        V2C3,   8, 
        V2HT,   8, 
        S1DE,   8, 
        S1AT,   8, 
        S1PT,   8, 
        S1CT,   8, 
        S1HT,   8, 
        S2DE,   8, 
        S2AT,   8, 
        S2PT,   8, 
        S2CT,   8, 
        S2HT,   8, 
        S3DE,   8, 
        S3AT,   8, 
        S3PT,   8, 
        S3CT,   8, 
        S3HT,   8, 
        S4DE,   8, 
        S4AT,   8, 
        S4PT,   8, 
        S4CT,   8, 
        S4HT,   8, 
        S5DE,   8, 
        S5AT,   8, 
        S5PT,   8, 
        S5CT,   8, 
        S5HT,   8, 
        S6DE,   8, 
        S6AT,   8, 
        S6PT,   8, 
        S6CT,   8, 
        S6HT,   8, 
        S7DE,   8, 
        S7AT,   8, 
        S7PT,   8, 
        S7CT,   8, 
        S7HT,   8, 
        S1S3,   8, 
        S2S3,   8, 
        S3S3,   8, 
        S4S3,   8, 
        S5S3,   8, 
        S6S3,   8, 
        S7S3,   8, 
        ICAE,   8, 
        PSME,   8, 
        PDT1,   8, 
        PLM1,   32, 
        PTW1,   32, 
        PDT2,   8, 
        PLM2,   32, 
        PTW2,   32, 
        DDT1,   8, 
        DDP1,   8, 
        DLI1,   16, 
        DPL1,   16, 
        DTW1,   32, 
        DMI1,   16, 
        DMA1,   16, 
        DMT1,   16, 
        DDT2,   8, 
        DDP2,   8, 
        DLI2,   16, 
        DPL2,   16, 
        DTW2,   32, 
        DMI2,   16, 
        DMA2,   16, 
        DMT2,   16, 
        WIFE,   8, 
        DOM1,   8, 
        LIM1,   16, 
        TIM1,   32, 
        DOM2,   8, 
        LIM2,   16, 
        TIM2,   32, 
        DOM3,   8, 
        LIM3,   16, 
        TIM3,   32, 
        TRD0,   8, 
        TRL0,   8, 
        TRD1,   8, 
        TRL1,   8, 
        WDM1,   8, 
        CID1,   16, 
        WDM2,   8, 
        CID2,   16, 
        Offset (0x378), 
        APPE,   8, 
        MPL1,   16, 
        MPL2,   16, 
        SDS0,   8, 
        SDS1,   8, 
        SDS2,   8, 
        SDS3,   8, 
        SDS4,   8, 
        SDS5,   8, 
        SDS6,   8, 
        SDS7,   8, 
        SDS8,   8, 
        SDS9,   8, 
        SDSA,   8, 
        TPLB,   8, 
        TPLH,   16, 
        WTVX,   8, 
        WITX,   8, 
        GPTD,   8, 
        GDBT,   16, 
        UTKX,   8, 
        SPTD,   8, 
        GEXN,   8, 
        TBTS,   8, 
        TBWS,   8, 
        AICS,   8, 
        TARS,   8, 
        FPAT,   8, 
        FPEN,   8, 
        FPGN,   32, 
        FPLV,   8, 
        CPAD,   16, 
        CPAB,   8, 
        TNAT,   8, 
        CPGN,   32, 
        CF2T,   8, 
        TDGS,   8, 
        DCSC,   8, 
        DCKE,   8, 
        UDCK,   8, 
        SUDK,   8, 
        OHPN,   8, 
        GHPN,   8, 
        EGPC,   32, 
        EGPV,   8, 
        TBDT,   32, 
        ATLB,   32, 
        SDM0,   8, 
        SDM1,   8, 
        SDM2,   8, 
        SDM3,   8, 
        SDM4,   8, 
        SDM5,   8, 
        SDM6,   8, 
        SDM7,   8, 
        SDM8,   8, 
        SDM9,   8, 
        SDMA,   8, 
        USTP,   8, 
        SSHI,   16, 
        SSLI,   16, 
        SSDI,   16, 
        FMHI,   16, 
        FMLI,   16, 
        FMDI,   16, 
        FPHI,   16, 
        FPLI,   16, 
        FPDI,   16, 
        M0CI,   16, 
        M1CI,   16, 
        M0CS,   16, 
        M1CS,   16, 
        M0CU,   16, 
        M1CU,   16, 
        CAMT,   8, 
        IVDF,   8, 
        IFWG,   64, 
        IVWS,   8, 
        IVPR,   8, 
        DIVO,   16, 
        DIVF,   16, 
        IVAD,   8, 
        IVRS,   8, 
        IVDG,   64, 
        DSPR,   8, 
        DDSO,   16, 
        DDSF,   16, 
        DSAD,   8, 
        DSRS,   8, 
        DVDG,   64, 
        EIDF,   8, 
        GFPS,   32, 
        GFPI,   32, 
        GNSM,   8, 
        GNSC,   8, 
        GGNR,   32, 
        GBTW,   32, 
        GBTK,   32, 
        GBTI,   32, 
        GPDI,   32, 
        GPLI,   32, 
        CL00,   8, 
        CL01,   8, 
        CL02,   8, 
        CL03,   8, 
        L0EN,   8, 
        L1EN,   8, 
        L2EN,   8, 
        L3EN,   8, 
        CDIV,   8, 
        C0TP,   8, 
        C0CV,   8, 
        C0GP,   8, 
        C0IB,   8, 
        C0IA,   16, 
        C0P0,   8, 
        C0P1,   8, 
        C0P2,   8, 
        C0P3,   8, 
        C0G0,   8, 
        C0G1,   8, 
        C0G2,   8, 
        C0G3,   8, 
        C0F0,   8, 
        C0F1,   8, 
        C0F2,   8, 
        C0F3,   8, 
        C0A0,   8, 
        C0A1,   8, 
        C0A2,   8, 
        C0A3,   8, 
        C0I0,   8, 
        C0I1,   8, 
        C0I2,   8, 
        C0I3,   8, 
        C0PL,   8, 
        C1TP,   8, 
        C1CV,   8, 
        C1GP,   8, 
        C1IB,   8, 
        C1IA,   16, 
        C1P0,   8, 
        C1P1,   8, 
        C1P2,   8, 
        C1P3,   8, 
        C1G0,   8, 
        C1G1,   8, 
        C1G2,   8, 
        C1G3,   8, 
        C1F0,   8, 
        C1F1,   8, 
        C1F2,   8, 
        C1F3,   8, 
        C1A0,   8, 
        C1A1,   8, 
        C1A2,   8, 
        C1A3,   8, 
        C1I0,   8, 
        C1I1,   8, 
        C1I2,   8, 
        C1I3,   8, 
        C1PL,   8, 
        C2TP,   8, 
        C2CV,   8, 
        C2GP,   8, 
        C2IB,   8, 
        C2IA,   16, 
        C2P0,   8, 
        C2P1,   8, 
        C2P2,   8, 
        C2P3,   8, 
        C2G0,   8, 
        C2G1,   8, 
        C2G2,   8, 
        C2G3,   8, 
        C2F0,   8, 
        C2F1,   8, 
        C2F2,   8, 
        C2F3,   8, 
        C2A0,   8, 
        C2A1,   8, 
        C2A2,   8, 
        C2A3,   8, 
        C2I0,   8, 
        C2I1,   8, 
        C2I2,   8, 
        C2I3,   8, 
        C2PL,   8, 
        C3TP,   8, 
        C3CV,   8, 
        C3GP,   8, 
        C3IB,   8, 
        C3IA,   16, 
        C3P0,   8, 
        C3P1,   8, 
        C3P2,   8, 
        C3P3,   8, 
        C3G0,   8, 
        C3G1,   8, 
        C3G2,   8, 
        C3G3,   8, 
        C3F0,   8, 
        C3F1,   8, 
        C3F2,   8, 
        C3F3,   8, 
        C3A0,   8, 
        C3A1,   8, 
        C3A2,   8, 
        C3A3,   8, 
        C3I0,   8, 
        C3I1,   8, 
        C3I2,   8, 
        C3I3,   8, 
        C3PL,   8, 
        L0SM,   8, 
        L0H0,   8, 
        L0H1,   8, 
        L0H2,   8, 
        L0H3,   8, 
        L0H4,   8, 
        L0H5,   8, 
        L0H6,   8, 
        L0H7,   8, 
        L0H8,   8, 
        L0PL,   8, 
        L0M0,   8, 
        L0M1,   8, 
        L0M2,   8, 
        L0M3,   8, 
        L0M4,   8, 
        L0M5,   8, 
        L0M6,   8, 
        L0M7,   8, 
        L0M8,   8, 
        L0M9,   8, 
        L0MA,   8, 
        L0MB,   8, 
        L0MC,   8, 
        L0MD,   8, 
        L0ME,   8, 
        L0MF,   8, 
        L0DI,   8, 
        L0BS,   8, 
        L0A0,   16, 
        L0A1,   16, 
        L0A2,   16, 
        L0A3,   16, 
        L0A4,   16, 
        L0A5,   16, 
        L0A6,   16, 
        L0A7,   16, 
        L0A8,   16, 
        L0A9,   16, 
        L0AA,   16, 
        L0AB,   16, 
        L0D0,   8, 
        L0D1,   8, 
        L0D2,   8, 
        L0D3,   8, 
        L0D4,   8, 
        L0D5,   8, 
        L0D6,   8, 
        L0D7,   8, 
        L0D8,   8, 
        L0D9,   8, 
        L0DA,   8, 
        L0DB,   8, 
        L0DV,   8, 
        L0CV,   8, 
        L0LU,   8, 
        L0NL,   8, 
        L0EE,   8, 
        L0VC,   8, 
        L0FS,   8, 
        L0DG,   8, 
        L0C0,   8, 
        L0C1,   8, 
        L0C2,   8, 
        L0C3,   8, 
        L0CK,   32, 
        L0CL,   8, 
        L1SM,   8, 
        L1H0,   8, 
        L1H1,   8, 
        L1H2,   8, 
        L1H3,   8, 
        L1H4,   8, 
        L1H5,   8, 
        L1H6,   8, 
        L1H7,   8, 
        L1H8,   8, 
        L1PL,   8, 
        L1M0,   8, 
        L1M1,   8, 
        L1M2,   8, 
        L1M3,   8, 
        L1M4,   8, 
        L1M5,   8, 
        L1M6,   8, 
        L1M7,   8, 
        L1M8,   8, 
        L1M9,   8, 
        L1MA,   8, 
        L1MB,   8, 
        L1MC,   8, 
        L1MD,   8, 
        L1ME,   8, 
        L1MF,   8, 
        L1DI,   8, 
        L1BS,   8, 
        L1A0,   16, 
        L1A1,   16, 
        L1A2,   16, 
        L1A3,   16, 
        L1A4,   16, 
        L1A5,   16, 
        L1A6,   16, 
        L1A7,   16, 
        L1A8,   16, 
        L1A9,   16, 
        L1AA,   16, 
        L1AB,   16, 
        L1D0,   8, 
        L1D1,   8, 
        L1D2,   8, 
        L1D3,   8, 
        L1D4,   8, 
        L1D5,   8, 
        L1D6,   8, 
        L1D7,   8, 
        L1D8,   8, 
        L1D9,   8, 
        L1DA,   8, 
        L1DB,   8, 
        L1DV,   8, 
        L1CV,   8, 
        L1LU,   8, 
        L1NL,   8, 
        L1EE,   8, 
        L1VC,   8, 
        L1FS,   8, 
        L1DG,   8, 
        L1C0,   8, 
        L1C1,   8, 
        L1C2,   8, 
        L1C3,   8, 
        L1CK,   32, 
        L1CL,   8, 
        L2SM,   8, 
        L2H0,   8, 
        L2H1,   8, 
        L2H2,   8, 
        L2H3,   8, 
        L2H4,   8, 
        L2H5,   8, 
        L2H6,   8, 
        L2H7,   8, 
        L2H8,   8, 
        L2PL,   8, 
        L2M0,   8, 
        L2M1,   8, 
        L2M2,   8, 
        L2M3,   8, 
        L2M4,   8, 
        L2M5,   8, 
        L2M6,   8, 
        L2M7,   8, 
        L2M8,   8, 
        L2M9,   8, 
        L2MA,   8, 
        L2MB,   8, 
        L2MC,   8, 
        L2MD,   8, 
        L2ME,   8, 
        L2MF,   8, 
        L2DI,   8, 
        L2BS,   8, 
        L2A0,   16, 
        L2A1,   16, 
        L2A2,   16, 
        L2A3,   16, 
        L2A4,   16, 
        L2A5,   16, 
        L2A6,   16, 
        L2A7,   16, 
        L2A8,   16, 
        L2A9,   16, 
        L2AA,   16, 
        L2AB,   16, 
        L2D0,   8, 
        L2D1,   8, 
        L2D2,   8, 
        L2D3,   8, 
        L2D4,   8, 
        L2D5,   8, 
        L2D6,   8, 
        L2D7,   8, 
        L2D8,   8, 
        L2D9,   8, 
        L2DA,   8, 
        L2DB,   8, 
        L2DV,   8, 
        L2CV,   8, 
        L2LU,   8, 
        L2NL,   8, 
        L2EE,   8, 
        L2VC,   8, 
        L2FS,   8, 
        L2DG,   8, 
        L2C0,   8, 
        L2C1,   8, 
        L2C2,   8, 
        L2C3,   8, 
        L2CK,   32, 
        L2CL,   8, 
        L3SM,   8, 
        L3H0,   8, 
        L3H1,   8, 
        L3H2,   8, 
        L3H3,   8, 
        L3H4,   8, 
        L3H5,   8, 
        L3H6,   8, 
        L3H7,   8, 
        L3H8,   8, 
        L3PL,   8, 
        L3M0,   8, 
        L3M1,   8, 
        L3M2,   8, 
        L3M3,   8, 
        L3M4,   8, 
        L3M5,   8, 
        L3M6,   8, 
        L3M7,   8, 
        L3M8,   8, 
        L3M9,   8, 
        L3MA,   8, 
        L3MB,   8, 
        L3MC,   8, 
        L3MD,   8, 
        L3ME,   8, 
        L3MF,   8, 
        L3DI,   8, 
        L3BS,   8, 
        L3A0,   16, 
        L3A1,   16, 
        L3A2,   16, 
        L3A3,   16, 
        L3A4,   16, 
        L3A5,   16, 
        L3A6,   16, 
        L3A7,   16, 
        L3A8,   16, 
        L3A9,   16, 
        L3AA,   16, 
        L3AB,   16, 
        L3D0,   8, 
        L3D1,   8, 
        L3D2,   8, 
        L3D3,   8, 
        L3D4,   8, 
        L3D5,   8, 
        L3D6,   8, 
        L3D7,   8, 
        L3D8,   8, 
        L3D9,   8, 
        L3DA,   8, 
        L3DB,   8, 
        L3DV,   8, 
        L3CV,   8, 
        L3LU,   8, 
        L3NL,   8, 
        L3EE,   8, 
        L3VC,   8, 
        L3FS,   8, 
        L3DG,   8, 
        L3C0,   8, 
        L3C1,   8, 
        L3C2,   8, 
        L3C3,   8, 
        L3CK,   32, 
        L3CL,   8, 
        ECR1,   8, 
        Offset (0x60E), 
        I2SC,   8, 
        ODV0,   8, 
        ODV1,   8, 
        ODV2,   8, 
        ODV3,   8, 
        ODV4,   8, 
        ODV5,   8, 
        UBCB,   32, 
        EMOD,   8, 
        WIFC,   8, 
        Offset (0x622), 
        TPLS,   8, 
        TPDB,   8, 
        TPDH,   16, 
        TPDS,   8, 
        ADPM,   32, 
        AG1L,   64, 
        AG1H,   64, 
        AG2L,   64, 
        AG2H,   64, 
        AG3L,   64, 
        AG3H,   64, 
        HEFE,   8, 
        XDCE,   8, 
        STXE,   8, 
        STX0,   8, 
        STX1,   8, 
        STX2,   8, 
        STX3,   8, 
        STX4,   8, 
        STX5,   8, 
        STX6,   8, 
        STX7,   8, 
        STX8,   8, 
        STX9,   8, 
        RTVM,   8, 
        USTC,   8, 
        BATP,   8, 
        TSDB,   8, 
        DEPC,   8, 
        PDFC,   8, 
        IVCM,   8, 
        HEB1,   32, 
        RBY1,   8, 
        RBY2,   8, 
        SCSS,   8, 
        HAID,   8, 
        NCTC,   8, 
        NCTI,   8, 
        NCTH,   8, 
        HSIO,   8, 
        TPPT,   8, 
        SHAP,   8, 
        EIAP,   8, 
        ZPOD,   8, 
        SRSP,   32, 
        CEDS,   8, 
        EHK3,   8, 
        EHK4,   8, 
        EHK5,   8, 
        EHK6,   8, 
        EHK7,   8, 
        EHK8,   8, 
        VBVP,   8, 
        VBVD,   8, 
        VBHB,   8, 
        VBRL,   8, 
        SMSS,   8, 
        VBST,   8, 
        ADAS,   8, 
        PPBG,   32, 
        AEAB,   8, 
        AHDB,   8, 
        PBSD,   8, 
        DPLL,   8, 
        DPHL,   8, 
        PWIG,   8, 
        MESE,   8, 
        ICAT,   8, 
        ICPV,   8, 
        ICCR,   8, 
        ICC3,   8, 
        ICHT,   8, 
        XSMI,   32, 
        PAPE,   32, 
        PSTW,   32, 
        MWLR,   32, 
        UP8P,   32, 
        MS2R,   32, 
        MS2P,   32, 
        UCSI,   8, 
        UCG1,   32, 
        UCG2,   32, 
        WGUR,   32, 
        WRFE,   8, 
        WRC1,   8, 
        WRC2,   8, 
        WRC3,   8, 
        WRC4,   8, 
        AWVI,   32, 
        Offset (0x6E0), 
        WTSP,   8, 
        WGWS,   8, 
        PIDE,   8, 
        C0VE,   8, 
        C0W0,   8, 
        C0W1,   8, 
        C0W2,   8, 
        C0W3,   8, 
        C0W4,   8, 
        C0W5,   8, 
        C1VE,   8, 
        C1W0,   8, 
        C1W1,   8, 
        C1W2,   8, 
        C1W3,   8, 
        C1W4,   8, 
        C1W5,   8, 
        C2VE,   8, 
        C2W0,   8, 
        C2W1,   8, 
        C2W2,   8, 
        C2W3,   8, 
        C2W4,   8, 
        C2W5,   8, 
        C3VE,   8, 
        C3W0,   8, 
        C3W1,   8, 
        C3W2,   8, 
        C3W3,   8, 
        C3W4,   8, 
        C3W5,   8, 
        L0LE,   8, 
        L0PP,   8, 
        L0VR,   8, 
        L1LE,   8, 
        L1PP,   8, 
        L1VR,   8, 
        L2LE,   8, 
        L2PP,   8, 
        L2VR,   8, 
        L3LE,   8, 
        L3PP,   8, 
        L3VR,   8, 
        WLRP,   8, 
        SSRP,   8, 
        WIPR,   8, 
        Offset (0x71E), 
        UTCM,   8, 
        USME,   8, 
        UPT1,   8, 
        UPT2,   8, 
        TWIN,   8, 
        TRWA,   8, 
        PEWE,   8, 
        Offset (0x74E), 
        ELPM,   32, 
        ELPS,   32, 
        Offset (0x758), 
        UCRT,   8, 
        TBOD,   16, 
        TSXW,   8, 
        VRGP,   32, 
        PVSC,   8, 
        AES3,   8, 
        PSF0,   32, 
        PSF1,   32, 
        PSF2,   32, 
        PSF3,   32, 
        PSF4,   32, 
        PSF5,   32, 
        NVBB,   32, 
        LKFG,   16, 
        OIOP,   16, 
        ODAL,   8, 
        OCMD,   8, 
        ODA0,   8, 
        ODA1,   8, 
        ODA2,   8, 
        ODA3,   8, 
        TJMX,   8, 
        CAMV,   16, 
        CAMP,   16, 
        BAEE,   8, 
        BTCP,   8, 
        BSCP,   8, 
        IMXR,   32, 
        IMXW,   32, 
        IMMK,   8, 
        PIM0,   32, 
        OIM0,   32, 
        PIM1,   32, 
        OIM1,   32, 
        PIM2,   32, 
        OIM2,   32, 
        PIM3,   32, 
        OIM3,   32, 
        PFBA,   32, 
        BKST,   8, 
        GPCF,   8, 
        ISI7,   8, 
        CIM1,   32, 
        HSFG,   8, 
        HSLF,   8, 
        MOLF,   8
    }

    Scope (_SB)
    {
        Name (PRSA, Buffer (0x06)
        {
             0x23, 0x78, 0xDC, 0x18, 0x79, 0x00               // #x..y.
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Name (PR00, Package (0x1E)
        {
            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x03, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, , 
                Zero
            }
        })
        Name (AR00, Package (0x1E)
        {
            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }
        })
        Name (PR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }
        })
        Name (AR14, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, , 
                Zero
            }
        })
        Name (AR15, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, , 
                Zero
            }
        })
        Name (AR16, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, , 
                Zero
            }
        })
        Name (AR17, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR18, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }
        })
        Name (AR18, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR19, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, , 
                Zero
            }
        })
        Name (AR19, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR1A, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, , 
                Zero
            }
        })
        Name (AR1A, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR1B, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, , 
                Zero
            }
        })
        Name (AR1B, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, , 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, , 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, , 
                Zero
            }
        })
        Name (AR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }
        })
        Name (AR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, , 
                Zero
            }
        })
        Name (AR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR0A, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, , 
                Zero
            }
        })
        Name (AR0A, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR0B, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, , 
                Zero
            }
        })
        Name (AR0B, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR0C, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }
        })
        Name (AR0C, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR0D, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, , 
                Zero
            }
        })
        Name (AR0D, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR0E, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, , 
                Zero
            }
        })
        Name (AR0E, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR0F, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, , 
                Zero
            }
        })
        Name (AR0F, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR10, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }
        })
        Name (AR10, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR11, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, , 
                Zero
            }
        })
        Name (AR11, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, , 
                Zero
            }
        })
        Name (AR12, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, , 
                Zero
            }
        })
        Name (AR13, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, , 
                Zero
            }
        })
        Name (AR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, , 
                Zero
            }
        })
        Name (AR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, , 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, , 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
    }

    Scope (_SB)
    {
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00) /* \_SB_.AR00 */
                }

                Return (PR00) /* \_SB_.PR00 */
            }

            OperationRegion (HBUS, PCI_Config, Zero, 0x0100)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x40), 
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                Offset (0x48), 
                MHEN,   1, 
                    ,   14, 
                MHBR,   17, 
                Offset (0x50), 
                GCLK,   1, 
                Offset (0x54), 
                D0EN,   1, 
                D1F2,   1, 
                D1F1,   1, 
                D1F0,   1, 
                Offset (0x60), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                Offset (0x68), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                Offset (0x70), 
                    ,   20, 
                MEBR,   12, 
                Offset (0x80), 
                PMLK,   1, 
                    ,   3, 
                PM0H,   2, 
                Offset (0x81), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                Offset (0x82), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                Offset (0x83), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                Offset (0x84), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                Offset (0x85), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                Offset (0x86), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                Offset (0x87), 
                Offset (0xA8), 
                    ,   20, 
                TUUD,   19, 
                Offset (0xBC), 
                    ,   20, 
                TLUD,   12, 
                Offset (0xC8), 
                    ,   7, 
                HTSE,   1
            }

            Name (BUF0, Buffer (0x021C)
            {
                /* 0000 */  0x88, 0x0D, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  // ........
                /* 0010 */  0x87, 0x17, 0x00, 0x01, 0x0C, 0x03, 0x00, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x0C,  // ........
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x0C,  // ........
                /* 0028 */  0x00, 0x00, 0x47, 0x01, 0xF8, 0x0C, 0xF8, 0x0C,  // ..G.....
                /* 0030 */  0x01, 0x08, 0x87, 0x17, 0x00, 0x01, 0x0C, 0x03,  // ........
                /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00,  // ........
                /* 0040 */  0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0048 */  0x00, 0xF3, 0x00, 0x00, 0x87, 0x17, 0x00, 0x00,  // ........
                /* 0050 */  0x0C, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0058 */  0x0A, 0x00, 0xFF, 0xFF, 0x0B, 0x00, 0x00, 0x00,  // ........
                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x87, 0x17,  // ........
                /* 0068 */  0x00, 0x00, 0x0C, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0070 */  0x00, 0x00, 0x0C, 0x00, 0xFF, 0x3F, 0x0C, 0x00,  // .....?..
                /* 0078 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 0080 */  0x87, 0x17, 0x00, 0x00, 0x0C, 0x03, 0x00, 0x00,  // ........
                /* 0088 */  0x00, 0x00, 0x00, 0x40, 0x0C, 0x00, 0xFF, 0x7F,  // ...@....
                /* 0090 */  0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 0098 */  0x00, 0x00, 0x87, 0x17, 0x00, 0x00, 0x0C, 0x03,  // ........
                /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x00,  // ........
                /* 00A8 */  0xFF, 0xBF, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00B0 */  0x00, 0x40, 0x00, 0x00, 0x87, 0x17, 0x00, 0x00,  // .@......
                /* 00B8 */  0x0C, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0,  // ........
                /* 00C0 */  0x0C, 0x00, 0xFF, 0xFF, 0x0C, 0x00, 0x00, 0x00,  // ........
                /* 00C8 */  0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x87, 0x17,  // ...@....
                /* 00D0 */  0x00, 0x00, 0x0C, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00D8 */  0x00, 0x00, 0x0D, 0x00, 0xFF, 0x3F, 0x0D, 0x00,  // .....?..
                /* 00E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 00E8 */  0x87, 0x17, 0x00, 0x00, 0x0C, 0x03, 0x00, 0x00,  // ........
                /* 00F0 */  0x00, 0x00, 0x00, 0x40, 0x0D, 0x00, 0xFF, 0x7F,  // ...@....
                /* 00F8 */  0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 0100 */  0x00, 0x00, 0x87, 0x17, 0x00, 0x00, 0x0C, 0x03,  // ........
                /* 0108 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0D, 0x00,  // ........
                /* 0110 */  0xFF, 0xBF, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0118 */  0x00, 0x40, 0x00, 0x00, 0x87, 0x17, 0x00, 0x00,  // .@......
                /* 0120 */  0x0C, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0,  // ........
                /* 0128 */  0x0D, 0x00, 0xFF, 0xFF, 0x0D, 0x00, 0x00, 0x00,  // ........
                /* 0130 */  0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x87, 0x17,  // ...@....
                /* 0138 */  0x00, 0x00, 0x0C, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0140 */  0x00, 0x00, 0x0E, 0x00, 0xFF, 0x3F, 0x0E, 0x00,  // .....?..
                /* 0148 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 0150 */  0x87, 0x17, 0x00, 0x00, 0x0C, 0x03, 0x00, 0x00,  // ........
                /* 0158 */  0x00, 0x00, 0x00, 0x40, 0x0E, 0x00, 0xFF, 0x7F,  // ...@....
                /* 0160 */  0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 0168 */  0x00, 0x00, 0x87, 0x17, 0x00, 0x00, 0x0C, 0x03,  // ........
                /* 0170 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0E, 0x00,  // ........
                /* 0178 */  0xFF, 0xBF, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0180 */  0x00, 0x40, 0x00, 0x00, 0x87, 0x17, 0x00, 0x00,  // .@......
                /* 0188 */  0x0C, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0,  // ........
                /* 0190 */  0x0E, 0x00, 0xFF, 0xFF, 0x0E, 0x00, 0x00, 0x00,  // ........
                /* 0198 */  0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x87, 0x17,  // ...@....
                /* 01A0 */  0x00, 0x00, 0x0C, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01A8 */  0x00, 0x00, 0x0F, 0x00, 0xFF, 0xFF, 0x0F, 0x00,  // ........
                /* 01B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                /* 01B8 */  0x87, 0x17, 0x00, 0x00, 0x0C, 0x01, 0x00, 0x00,  // ........
                /* 01C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF,  // ........
                /* 01C8 */  0xFF, 0xDF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01D0 */  0x00, 0xE0, 0x8A, 0x2B, 0x00, 0x00, 0x0C, 0x01,  // ...+....
                /* 01D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01E0 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01E8 */  0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01F8 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0200 */  0x87, 0x17, 0x00, 0x00, 0x0C, 0x01, 0x00, 0x00,  // ........
                /* 0208 */  0x00, 0x00, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0xFF,  // ........
                /* 0210 */  0x7F, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0218 */  0x80, 0x01, 0x79, 0x00                           // ..y.
            })
            Name (EP_B, Zero)
            Name (MH_B, Zero)
            Name (PC_B, Zero)
            Name (PC_L, Zero)
            Name (DM_B, Zero)
            Method (GEPB, 0, Serialized)
            {
                If ((EP_B == Zero))
                {
                    EP_B = (EPBR << 0x0C)
                }

                Return (EP_B) /* \_SB_.PCI0.EP_B */
            }

            Method (GMHB, 0, Serialized)
            {
                If ((MH_B == Zero))
                {
                    MH_B = (MHBR << 0x0F)
                }

                Return (MH_B) /* \_SB_.PCI0.MH_B */
            }

            Method (GPCB, 0, Serialized)
            {
                If ((PC_B == Zero))
                {
                    PC_B = (PXBR << 0x1A)
                }

                Return (PC_B) /* \_SB_.PCI0.PC_B */
            }

            Method (GPCL, 0, Serialized)
            {
                If ((PC_L == Zero))
                {
                    PC_L = (0x10000000 >> PXSZ) /* \_SB_.PCI0.PXSZ */
                }

                Return (PC_L) /* \_SB_.PCI0.PC_L */
            }

            Method (GDMB, 0, Serialized)
            {
                If ((DM_B == Zero))
                {
                    DM_B = (DIBR << 0x0C)
                }

                Return (DM_B) /* \_SB_.PCI0.DM_B */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Local0 = GPCL ()
                CreateWordField (BUF0, 0x0A, PBMX)
                PBMX = ((Local0 >> 0x14) - 0x02)
                CreateWordField (BUF0, 0x0E, PBLN)
                PBLN = ((Local0 >> 0x14) - One)
                If (PM1L)
                {
                    CreateDWordField (BUF0, 0x7C, C0LN)
                    C0LN = Zero
                }

                If ((PM1L == One))
                {
                    CreateBitField (BUF0, 0x0358, C0RW)
                    C0RW = Zero
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, 0x96, C4LN)
                    C4LN = Zero
                }

                If ((PM1H == One))
                {
                    CreateBitField (BUF0, 0x0428, C4RW)
                    C4RW = Zero
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, 0xB0, C8LN)
                    C8LN = Zero
                }

                If ((PM2L == One))
                {
                    CreateBitField (BUF0, 0x04F8, C8RW)
                    C8RW = Zero
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, 0xCA, CCLN)
                    CCLN = Zero
                }

                If ((PM2H == One))
                {
                    CreateBitField (BUF0, 0x05C8, CCRW)
                    CCRW = Zero
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, 0xE4, D0LN)
                    D0LN = Zero
                }

                If ((PM3L == One))
                {
                    CreateBitField (BUF0, 0x0698, D0RW)
                    D0RW = Zero
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, 0xFE, D4LN)
                    D4LN = Zero
                }

                If ((PM3H == One))
                {
                    CreateBitField (BUF0, 0x0768, D4RW)
                    D4RW = Zero
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, 0x0118, D8LN)
                    D8LN = Zero
                }

                If ((PM4L == One))
                {
                    CreateBitField (BUF0, 0x0838, D8RW)
                    D8RW = Zero
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, 0x0132, DCLN)
                    DCLN = Zero
                }

                If ((PM4H == One))
                {
                    CreateBitField (BUF0, 0x0908, DCRW)
                    DCRW = Zero
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, 0x014C, E0LN)
                    E0LN = Zero
                }

                If ((PM5L == One))
                {
                    CreateBitField (BUF0, 0x09D8, E0RW)
                    E0RW = Zero
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, 0x0166, E4LN)
                    E4LN = Zero
                }

                If ((PM5H == One))
                {
                    CreateBitField (BUF0, 0x0AA8, E4RW)
                    E4RW = Zero
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, 0x0180, E8LN)
                    E8LN = Zero
                }

                If ((PM6L == One))
                {
                    CreateBitField (BUF0, 0x0B78, E8RW)
                    E8RW = Zero
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, 0x019A, ECLN)
                    ECLN = Zero
                }

                If ((PM6H == One))
                {
                    CreateBitField (BUF0, 0x0C48, ECRW)
                    ECRW = Zero
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, 0x01B4, F0LN)
                    F0LN = Zero
                }

                If ((PM0H == One))
                {
                    CreateBitField (BUF0, 0x0D18, F0RW)
                    F0RW = Zero
                }

                CreateDWordField (BUF0, 0x01C2, M1MN)
                CreateDWordField (BUF0, 0x01C6, M1MX)
                CreateDWordField (BUF0, 0x01CE, M1LN)
                M1LN = M32L /* External reference */
                M1MN = M32B /* External reference */
                M1MX = ((M1MN + M1LN) - One)
                If ((M64L == Zero))
                {
                    CreateQWordField (BUF0, 0x01F8, MSLN)
                    MSLN = Zero
                }
                Else
                {
                    CreateQWordField (BUF0, 0x01F8, M2LN)
                    CreateQWordField (BUF0, 0x01E0, M2MN)
                    CreateQWordField (BUF0, 0x01E8, M2MX)
                    M2LN = M64L /* External reference */
                    M2MN = M64B /* External reference */
                    M2MX = ((M2MN + M2LN) - One)
                }

                Return (BUF0) /* \_SB_.PCI0.BUF0 */
            }

            Name (GUID, ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */)
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Name (XCNT, Zero)
            Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
            {
                Local0 = Arg3
                CreateDWordField (Local0, Zero, CDW1)
                CreateDWordField (Local0, 0x04, CDW2)
                CreateDWordField (Local0, 0x08, CDW3)
                If ((Arg0 == GUID))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (!NEXP)
                    {
                        CTRL &= 0xFFFFFFF8
                    }

                    If ((TBTS == One))
                    {
                        CTRL &= 0xFFFFFFF7
                    }

                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One))
                        {
                            NHPG ()
                        }

                        If ((CTRL & 0x04))
                        {
                            NPME ()
                        }
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                    OSCC = CTRL /* \_SB_.PCI0.CTRL */
                    Return (Local0)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Local0)
                }
            }

            Scope (\_SB.PCI0)
            {
                Device (GFX0)
                {
                    Name (_ADR, 0x00020000)  // _ADR: Address
                }

                Device (B0D4)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (PCIC (Arg0))
                        {
                            Return (PCID (Arg0, Arg1, Arg2, Arg3))
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    Name (_ADR, 0x00040000)  // _ADR: Address
                }

                Device (ISP0)
                {
                    Name (_ADR, 0x00050000)  // _ADR: Address
                }
            }

            Scope (\_SB.PCI0)
            {
                Name (PALK, Zero)
                Name (PA0H, Zero)
                Name (PA1H, Zero)
                Name (PA1L, Zero)
                Name (PA2H, Zero)
                Name (PA2L, Zero)
                Name (PA3H, Zero)
                Name (PA3L, Zero)
                Name (PA4H, Zero)
                Name (PA4L, Zero)
                Name (PA5H, Zero)
                Name (PA5L, Zero)
                Name (PA6H, Zero)
                Name (PA6L, Zero)
                Method (NPTS, 1, NotSerialized)
                {
                    PA0H = PM0H /* \_SB_.PCI0.PM0H */
                    PALK = PMLK /* \_SB_.PCI0.PMLK */
                    PA1H = PM1H /* \_SB_.PCI0.PM1H */
                    PA1L = PM1L /* \_SB_.PCI0.PM1L */
                    PA2H = PM2H /* \_SB_.PCI0.PM2H */
                    PA2L = PM2L /* \_SB_.PCI0.PM2L */
                    PA3H = PM3H /* \_SB_.PCI0.PM3H */
                    PA3L = PM3L /* \_SB_.PCI0.PM3L */
                    PA4H = PM4H /* \_SB_.PCI0.PM4H */
                    PA4L = PM4L /* \_SB_.PCI0.PM4L */
                    PA5H = PM5H /* \_SB_.PCI0.PM5H */
                    PA5L = PM5L /* \_SB_.PCI0.PM5L */
                    PA6H = PM6H /* \_SB_.PCI0.PM6H */
                    PA6L = PM6L /* \_SB_.PCI0.PM6L */
                }

                Method (NWAK, 1, NotSerialized)
                {
                    PM0H = PA0H /* \_SB_.PCI0.PA0H */
                    PM1H = PA1H /* \_SB_.PCI0.PA1H */
                    PM1L = PA1L /* \_SB_.PCI0.PA1L */
                    PM2H = PA2H /* \_SB_.PCI0.PA2H */
                    PM2L = PA2L /* \_SB_.PCI0.PA2L */
                    PM3H = PA3H /* \_SB_.PCI0.PA3H */
                    PM3L = PA3L /* \_SB_.PCI0.PA3L */
                    PM4H = PA4H /* \_SB_.PCI0.PA4H */
                    PM4L = PA4L /* \_SB_.PCI0.PA4L */
                    PM5H = PA5H /* \_SB_.PCI0.PA5H */
                    PM5L = PA5L /* \_SB_.PCI0.PA5L */
                    PM6H = PA6H /* \_SB_.PCI0.PA6H */
                    PM6L = PA6L /* \_SB_.PCI0.PA6L */
                    PMLK = PALK /* \_SB_.PCI0.PALK */
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Scope (\_SB.PCI0.LPCB)
                {
                }

                Method (SPTS, 1, NotSerialized)
                {
                    SLPX = One
                    SLPE = One
                    If ((Arg0 == 0x03))
                    {
                        AES3 = One
                    }

                    ^^^WMI.HKDR = Zero
                    If (^EC.ECOK)
                    {
                        ^EC.WFNO = Zero
                    }

                    If ((Arg0 == 0x04))
                    {
                        PRM0 = 0x05
                        SSMP = 0xE0
                    }
                    Else
                    {
                        PRM0 = 0x04
                        SSMP = 0xE0
                    }
                }

                Method (SWAK, 1, NotSerialized)
                {
                    SLPE = Zero
                    AES3 = Zero
                    If (((PSF0 & 0x10) == Zero))
                    {
                        If (LIDS)
                        {
                            ^^GFX0.CLID = 0x03
                        }
                        Else
                        {
                            ^^GFX0.CLID = Zero
                        }
                    }

                    ^^^AC.IGNR = Zero
                    ^^^AC.CTMS = 0xA55A
                    If ((Arg0 == 0x04))
                    {
                        ^^^AC.PSSN = Zero
                    }

                    ^EC.SLFG = Zero
                    ^EC.ECTB = Zero
                    ^EC.B15C = Zero
                    If (^EC.ECOK)
                    {
                        ^^^AC.ACFG = ^EC.ADP /* \_SB_.PCI0.LPCB.EC__.ADP_ */
                        ^^^BAT0.UPBI ()
                        ^^^BAT0.UPBS ()
                        Notify (BAT0, Zero) // Bus Check
                        Notify (AC, Zero) // Bus Check
                        If ((Arg0 == 0x03)){}
                        If ((Arg0 == 0x04))
                        {
                            Local0 = 0x02
                            If ((OSYS < 0x07DC))
                            {
                                If ((OSYS == 0x03E8))
                                {
                                    Local0 = One
                                }
                                ElseIf ((OSYS == 0x07D9))
                                {
                                    Local0 = 0x08
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            ^EC.ECOS = Local0
                            If ((OSYS >= 0x07D6))
                            {
                                ^EC.WINF |= One
                            }
                            ElseIf ((OSYS == 0x03E8))
                            {
                                ^EC.WINF |= One
                            }

                            If ((PSF0 & 0x20))
                            {
                                ^EC.INF2 |= One
                            }
                            Else
                            {
                                ^EC.INF2 &= 0xFE
                            }

                            If ((OSYS < 0x07D9))
                            {
                                ^EC.INF2 &= 0xFD
                            }
                        }

                        If ((OSYS == 0x03E8)){}
                        If ((PSF0 & 0x02))
                        {
                            \_TZ.TZ0.PPFG = Zero
                            ^EC.INF2 &= 0xDF
                        }
                    }

                    If (RTCS){}
                    Else
                    {
                        Notify (PWRB, 0x02) // Device Wake
                    }
                }

                OperationRegion (SMIE, SystemIO, PMBA, 0x04)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   10, 
                    RTCS,   1, 
                        ,   3, 
                    PEXS,   1, 
                    WAKS,   1, 
                    Offset (0x03), 
                    PWBT,   1, 
                    Offset (0x04)
                }

                OperationRegion (SLPR, SystemIO, SMCR, 0x08)
                Field (SLPR, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    SLPE,   1, 
                        ,   31, 
                    SLPX,   1, 
                    Offset (0x08)
                }

                OperationRegion (CPSB, SystemMemory, 0xC0000000, 0x10)
                Field (CPSB, AnyAcc, NoLock, Preserve)
                {
                    RTCX,   1, 
                    SBB0,   7, 
                    SBB1,   8, 
                    SBB2,   8, 
                    SBB3,   8, 
                    SBB4,   8, 
                    SBB5,   8, 
                    SBB6,   8, 
                    SBB7,   8, 
                    SBB8,   8, 
                    SBB9,   8, 
                    SBBA,   8, 
                    SBBB,   8, 
                    SBBC,   8, 
                    SBBD,   8, 
                    SBBE,   8, 
                    SBBF,   8
                }
            }

            Device (RP17)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP17._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP17.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP17.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR14) /* \_SB_.AR14 */
                    }

                    Return (PR14) /* \_SB_.PR14 */
                }
            }

            Device (RP18)
            {
                Name (_ADR, 0x001B0001)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP18._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP18.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP18.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR15) /* \_SB_.AR15 */
                    }

                    Return (PR15) /* \_SB_.PR15 */
                }
            }

            Device (RP19)
            {
                Name (_ADR, 0x001B0002)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP19._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP19.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP19.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR16) /* \_SB_.AR16 */
                    }

                    Return (PR16) /* \_SB_.PR16 */
                }
            }

            Device (RP20)
            {
                Name (_ADR, 0x001B0003)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP20._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP20.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP20.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR17) /* \_SB_.AR17 */
                    }

                    Return (PR17) /* \_SB_.PR17 */
                }
            }

            Device (RP21)
            {
                Name (_ADR, 0x001B0004)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP21._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP21.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP21.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR18) /* \_SB_.AR18 */
                    }

                    Return (PR18) /* \_SB_.PR18 */
                }
            }

            Device (RP22)
            {
                Name (_ADR, 0x001B0005)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP22._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP22.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP22.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR19) /* \_SB_.AR19 */
                    }

                    Return (PR19) /* \_SB_.PR19 */
                }
            }

            Device (RP23)
            {
                Name (_ADR, 0x001B0006)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP23._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP23.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP23.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR1A) /* \_SB_.AR1A */
                    }

                    Return (PR1A) /* \_SB_.PR1A */
                }
            }

            Device (RP24)
            {
                Name (_ADR, 0x001B0007)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP24._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP24.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP24.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR1B) /* \_SB_.AR1B */
                    }

                    Return (PR1B) /* \_SB_.PR1B */
                }
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP01._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP01.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP01.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04) /* \_SB_.AR04 */
                    }

                    Return (PR04) /* \_SB_.PR04 */
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP02._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP02.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP02.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05) /* \_SB_.AR05 */
                    }

                    Return (PR05) /* \_SB_.PR05 */
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP03._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP03.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP03.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06) /* \_SB_.AR06 */
                    }

                    Return (PR06) /* \_SB_.PR06 */
                }

                Device (D049)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP04._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP04.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP04.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR07) /* \_SB_.AR07 */
                    }

                    Return (PR07) /* \_SB_.PR07 */
                }
            }

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP05._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP05.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP05.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR08) /* \_SB_.AR08 */
                    }

                    Return (PR08) /* \_SB_.PR08 */
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP06._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP06.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP06.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR09) /* \_SB_.AR09 */
                    }

                    Return (PR09) /* \_SB_.PR09 */
                }
            }

            Device (RP07)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP07._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP07.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP07.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0A) /* \_SB_.AR0A */
                    }

                    Return (PR0A) /* \_SB_.PR0A */
                }
            }

            Device (RP08)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP08._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP08.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP08.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0B) /* \_SB_.AR0B */
                    }

                    Return (PR0B) /* \_SB_.PR0B */
                }
            }

            Device (RP09)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP09._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP09.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP09.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0C) /* \_SB_.AR0C */
                    }

                    Return (PR0C) /* \_SB_.PR0C */
                }
            }

            Device (RP10)
            {
                Name (_ADR, 0x001D0001)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP10._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP10.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP10.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0D) /* \_SB_.AR0D */
                    }

                    Return (PR0D) /* \_SB_.PR0D */
                }
            }

            Device (RP11)
            {
                Name (_ADR, 0x001D0002)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP11._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP11.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP11.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0E) /* \_SB_.AR0E */
                    }

                    Return (PR0E) /* \_SB_.PR0E */
                }
            }

            Device (RP12)
            {
                Name (_ADR, 0x001D0003)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP12._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP12.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP12.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0F) /* \_SB_.AR0F */
                    }

                    Return (PR0F) /* \_SB_.PR0F */
                }
            }

            Device (RP13)
            {
                Name (_ADR, 0x001D0004)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP13._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP13.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP13.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR10) /* \_SB_.AR10 */
                    }

                    Return (PR10) /* \_SB_.PR10 */
                }
            }

            Device (RP14)
            {
                Name (_ADR, 0x001D0005)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP14._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP14.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP14.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR11) /* \_SB_.AR11 */
                    }

                    Return (PR11) /* \_SB_.PR11 */
                }
            }

            Device (RP15)
            {
                Name (_ADR, 0x001D0006)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP15._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP15.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP15.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR12) /* \_SB_.AR12 */
                    }

                    Return (PR12) /* \_SB_.PR12 */
                }
            }

            Device (RP16)
            {
                Name (_ADR, 0x001D0007)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, Zero, 0x0480)
                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    VDID,   32, 
                    Offset (0x19), 
                    SBNR,   8, 
                    Offset (0x50), 
                    L0SE,   1, 
                        ,   3, 
                    LDIS,   1, 
                    Offset (0x51), 
                    Offset (0x52), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x54), 
                        ,   6, 
                    HPCE,   1, 
                    Offset (0x5A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x5B), 
                    Offset (0x60), 
                    Offset (0x62), 
                    PSPX,   1, 
                    PMEP,   1, 
                    Offset (0xA4), 
                    D3HT,   2, 
                    Offset (0xD8), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                    Offset (0xE2), 
                        ,   2, 
                    L23E,   1, 
                    L23R,   1, 
                    Offset (0x324), 
                        ,   3, 
                    LEDM,   1, 
                    Offset (0x420), 
                        ,   30, 
                    DPGE,   1
                }

                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0xDC), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Name (LTRV, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Name (OPTS, Buffer (0x02)
                                {
                                     0x00, 0x00                                       // ..
                                })
                                CreateBitField (OPTS, Zero, FUN0)
                                CreateBitField (OPTS, 0x04, FUN4)
                                CreateBitField (OPTS, 0x06, FUN6)
                                CreateBitField (OPTS, 0x08, FUN8)
                                CreateBitField (OPTS, 0x09, FUN9)
                                If ((Arg1 >= 0x02))
                                {
                                    FUN0 = One
                                    If ((ECR1 == One))
                                    {
                                        If ((Arg1 >= 0x03))
                                        {
                                            FUN8 = One
                                            FUN9 = One
                                        }
                                    }
                                }

                                Return (OPTS) /* \_SB_.PCI0.RP16._DSM.OPTS */
                            }
                            Case (0x04)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Buffer (0x10)
                                    {
                                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                                    })
                                }
                            }
                            Case (0x05)
                            {
                                If ((Arg1 == One))
                                {
                                    Return (One)
                                }
                            }
                            Case (0x06)
                            {
                                If ((Arg1 >= 0x02))
                                {
                                    Return (Zero)
                                }
                            }
                            Case (0x08)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (One)
                                    }
                                }
                            }
                            Case (0x09)
                            {
                                If ((ECR1 == One))
                                {
                                    If ((Arg1 >= 0x03))
                                    {
                                        Return (Package (0x05)
                                        {
                                            0xC350, 
                                            Ones, 
                                            Ones, 
                                            0xC350, 
                                            Ones
                                        })
                                    }
                                }
                            }

                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x69, 0x04))
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (HPCE) /* \_SB_.PCI0.RP16.HPCE */
                    }
                }

                Method (HPME, 0, Serialized)
                {
                    If (((VDID != 0xFFFFFFFF) && (PMSX == One)))
                    {
                        Sleep (0xC8)
                        If ((PSPX || PMEP))
                        {
                            Local1 = PMEX /* \_SB_.PCI0.RP16.PMEX */
                            PMEX = Zero
                            Sleep (0x32)
                            PSPX = One
                            Sleep (0x32)
                            If (PSPX)
                            {
                                PSPX = One
                                Sleep (0x32)
                            }

                            PMEX = Local1
                        }

                        If (PMSX)
                        {
                            Local0 = 0xC8
                            While (Local0)
                            {
                                PMSX = One
                                If (PMSX)
                                {
                                    Local0--
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }

                            Notify (PXSX, 0x02) // Device Wake
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    LTRZ = LTR1 /* \LTR1 */
                    LMSL = PML1 /* \PML1 */
                    LNSL = PNL1 /* \PNL1 */
                    OBFZ = OBF1 /* \OBF1 */
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x69, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR13) /* \_SB_.AR13 */
                    }

                    Return (PR13) /* \_SB_.PR13 */
                }
            }

            Device (PEG0)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR01) /* \_SB_.AR01 */
                    }

                    Return (PR01) /* \_SB_.PR01 */
                }

                Device (PEGP)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (PEG1)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02) /* \_SB_.AR02 */
                    }

                    Return (PR02) /* \_SB_.PR02 */
                }

                Device (PEGP)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (PEG2)
            {
                Name (_ADR, 0x00010002)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR03) /* \_SB_.AR03 */
                    }

                    Return (PR03) /* \_SB_.PR03 */
                }

                Device (PEGP)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (Arg0)
        {
            \_SB.TPM.TPTS (Arg0)
            \_SB.PCI0.LPCB.SPTS (Arg0)
            \_SB.PCI0.NPTS (Arg0)
            RPTS (Arg0)
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        RWAK (Arg0)
        \_SB.PCI0.NWAK (Arg0)
        \_SB.PCI0.LPCB.SWAK (Arg0)
        Return (WAKP) /* \WAKP */
    }

    Scope (_PR)
    {
        Processor (PR00, 0x01, 0x00001810, 0x06){}
        Processor (PR01, 0x02, 0x00001810, 0x06){}
        Processor (PR02, 0x03, 0x00001810, 0x06){}
        Processor (PR03, 0x04, 0x00001810, 0x06){}
        Processor (PR04, 0x05, 0x00001810, 0x06){}
        Processor (PR05, 0x06, 0x00001810, 0x06){}
        Processor (PR06, 0x07, 0x00001810, 0x06){}
        Processor (PR07, 0x08, 0x00001810, 0x06){}
        Processor (PR08, 0x09, 0x00001810, 0x06){}
        Processor (PR09, 0x0A, 0x00001810, 0x06){}
        Processor (PR10, 0x0B, 0x00001810, 0x06){}
        Processor (PR11, 0x0C, 0x00001810, 0x06){}
        Processor (PR12, 0x0D, 0x00001810, 0x06){}
        Processor (PR13, 0x0E, 0x00001810, 0x06){}
        Processor (PR14, 0x0F, 0x00001810, 0x06){}
        Processor (PR15, 0x10, 0x00001810, 0x06){}
    }

    Scope (_PR.PR00)
    {
        Name (CPC2, Package (0x15)
        {
            0x15, 
            0x02, 
            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x00, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0xCE,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x00, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE7,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE8,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x02, 0x01, 0x04, 0x77,  // .......w
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x01, 0x00, 0x04, 0x70,  // .......p
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            One, 
            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x0A, 0x20, 0x04, 0x74,  // ..... .t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Zero
        })
        Name (CPOC, Package (0x15)
        {
            0x15, 
            0x02, 
            0xFF, 
            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0xCE,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x71,  // .......q
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x10, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x00, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x08, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE7,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x40, 0x00, 0x04, 0xE8,  // ....@...
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x02, 0x01, 0x04, 0x77,  // .......w
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x01, 0x00, 0x04, 0x70,  // .......p
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            One, 
            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x0A, 0x20, 0x04, 0x74,  // ..... .t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Buffer (0x11)
            {
                /* 0000 */  0x82, 0x0C, 0x00, 0x7F, 0x08, 0x18, 0x04, 0x74,  // .......t
                /* 0008 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0010 */  0x00                                             // .
            }, 

            Zero
        })
    }

    Scope (_SB)
    {
        Device (PAGD)
        {
            Name (_HID, "ACPI000C" /* Processor Aggregator Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Processor Aggregator Device"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (_PUR, Package (0x02)  // _PUR: Processor Utilization Request
            {
                One, 
                Zero
            })
        }
    }

    Scope (_SB.PCI0)
    {
        Device (PDRC)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (BUF0, Buffer (0x86)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x80, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00,  // ........
                /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0030 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD2, 0xFE,  // ........
                /* 0038 */  0x00, 0x00, 0x02, 0x00, 0x86, 0x09, 0x00, 0x00,  // ........
                /* 0040 */  0x00, 0x00, 0xD9, 0xFE, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 0048 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x50, 0xD4, 0xFE,  // .....P..
                /* 0050 */  0x00, 0xB0, 0x04, 0x00, 0x86, 0x09, 0x00, 0x00,  // ........
                /* 0058 */  0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x01,  // ........
                /* 0060 */  0x86, 0x09, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xFE,  // ........
                /* 0068 */  0x00, 0x00, 0x10, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0078 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0080 */  0x00, 0x00, 0x00, 0x00, 0x79, 0x00               // ....y.
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (BUF0, 0x04, MBR0)
                MBR0 = GMHB ()
                CreateDWordField (BUF0, 0x10, DBR0)
                DBR0 = GDMB ()
                CreateDWordField (BUF0, 0x1C, EBR0)
                EBR0 = GEPB ()
                CreateDWordField (BUF0, 0x28, XBR0)
                XBR0 = GPCB ()
                CreateDWordField (BUF0, 0x2C, XSZ0)
                XSZ0 = GPCL ()
                CreateDWordField (BUF0, 0x70, SXRA)
                SXRA = SXRB /* \SXRB */
                CreateDWordField (BUF0, 0x74, SXRL)
                SXRL = SXRS /* \SXRS */
                If (!HPTE)
                {
                    CreateDWordField (BUF0, 0x7C, HBAS)
                    CreateDWordField (BUF0, 0x80, HLEN)
                    HBAS = HPTB /* \HPTB */
                    HLEN = 0x0400
                }

                Return (BUF0) /* \_SB_.PCI0.PDRC.BUF0 */
            }
        }
    }

    Name (PNVB, 0xFFFF0000)
    Name (PNVL, 0xAA55)
    If ((ECR1 == One))
    {
        Scope (_SB.PCI0)
        {
            Name (PCIG, ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */)
            Method (PCID, 4, Serialized)
            {
                If ((Arg0 == PCIG))
                {
                    If ((Arg1 >= 0x03))
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0x01, 0x03                                       // ..
                            })
                        }

                        If ((Arg2 == 0x08))
                        {
                            Return (One)
                        }

                        If ((Arg2 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xC350, 
                                Ones, 
                                Ones, 
                                0xC350, 
                                Ones
                            })
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (PCIC, 1, Serialized)
        {
            If ((ECR1 == One))
            {
                If ((Arg0 == PCIG))
                {
                    Return (One)
                }
            }

            Return (Zero)
        }
    }

    OperationRegion (PNVA, SystemMemory, PNVB, PNVL)
    Field (PNVA, AnyAcc, Lock, Preserve)
    {
        PCHS,   16, 
        PCHG,   16, 
        RPA1,   32, 
        RPA2,   32, 
        RPA3,   32, 
        RPA4,   32, 
        RPA5,   32, 
        RPA6,   32, 
        RPA7,   32, 
        RPA8,   32, 
        RPA9,   32, 
        RPAA,   32, 
        RPAB,   32, 
        RPAC,   32, 
        RPAD,   32, 
        RPAE,   32, 
        RPAF,   32, 
        RPAG,   32, 
        RPAH,   32, 
        RPAI,   32, 
        RPAJ,   32, 
        RPAK,   32, 
        RPAL,   32, 
        RPAM,   32, 
        RPAN,   32, 
        RPAO,   32, 
        NHLA,   64, 
        NHLL,   32, 
        ADFM,   32, 
        SBRG,   32, 
        GPEM,   32, 
        G2L0,   32, 
        G2L1,   32, 
        G2L2,   32, 
        G2L3,   32, 
        G2L4,   32, 
        G2L5,   32, 
        G2L6,   32, 
        G2L7,   32, 
        G2L8,   32, 
        G2L9,   32, 
        PML1,   16, 
        PML2,   16, 
        PML3,   16, 
        PML4,   16, 
        PML5,   16, 
        PML6,   16, 
        PML7,   16, 
        PML8,   16, 
        PML9,   16, 
        PMLA,   16, 
        PMLB,   16, 
        PMLC,   16, 
        PMLD,   16, 
        PMLE,   16, 
        PMLF,   16, 
        PMLG,   16, 
        PMLH,   16, 
        PMLI,   16, 
        PMLJ,   16, 
        PMLK,   16, 
        PMLL,   16, 
        PMLM,   16, 
        PMLN,   16, 
        PMLO,   16, 
        PNL1,   16, 
        PNL2,   16, 
        PNL3,   16, 
        PNL4,   16, 
        PNL5,   16, 
        PNL6,   16, 
        PNL7,   16, 
        PNL8,   16, 
        PNL9,   16, 
        PNLA,   16, 
        PNLB,   16, 
        PNLC,   16, 
        PNLD,   16, 
        PNLE,   16, 
        PNLF,   16, 
        PNLG,   16, 
        PNLH,   16, 
        PNLI,   16, 
        PNLJ,   16, 
        PNLK,   16, 
        PNLL,   16, 
        PNLM,   16, 
        PNLN,   16, 
        PNLO,   16, 
        U0C0,   32, 
        U1C0,   32, 
        XHPC,   8, 
        XRPC,   8, 
        XSPC,   8, 
        XSPA,   8, 
        HPTB,   32, 
        HPTE,   8, 
        SMD0,   8, 
        SMD1,   8, 
        SMD2,   8, 
        SMD3,   8, 
        SMD4,   8, 
        SMD5,   8, 
        SMD6,   8, 
        SMD7,   8, 
        SMD8,   8, 
        SMD9,   8, 
        SMDA,   8, 
        SIR0,   8, 
        SIR1,   8, 
        SIR2,   8, 
        SIR3,   8, 
        SIR4,   8, 
        SIR5,   8, 
        SIR6,   8, 
        SIR7,   8, 
        SIR8,   8, 
        SIR9,   8, 
        SIRA,   8, 
        SB00,   64, 
        SB01,   64, 
        SB02,   64, 
        SB03,   64, 
        SB04,   64, 
        SB05,   64, 
        SB06,   64, 
        SB07,   64, 
        SB08,   64, 
        SB09,   64, 
        SB0A,   64, 
        SB10,   64, 
        SB11,   64, 
        SB12,   64, 
        SB13,   64, 
        SB14,   64, 
        SB15,   64, 
        SB16,   64, 
        SB17,   64, 
        SB18,   64, 
        SB19,   64, 
        SB1A,   64, 
        GPEN,   8, 
        SGIR,   8, 
        NIT1,   8, 
        NIT2,   8, 
        NIT3,   8, 
        NPM1,   8, 
        NPM2,   8, 
        NPM3,   8, 
        NPC1,   8, 
        NPC2,   8, 
        NPC3,   8, 
        NL11,   16, 
        NL12,   16, 
        NL13,   16, 
        ND21,   8, 
        ND22,   8, 
        ND23,   8, 
        ND11,   32, 
        ND12,   32, 
        ND13,   32, 
        NLR1,   16, 
        NLR2,   16, 
        NLR3,   16, 
        NLD1,   32, 
        NLD2,   32, 
        NLD3,   32, 
        NEA1,   16, 
        NEA2,   16, 
        NEA3,   16, 
        NEB1,   16, 
        NEB2,   16, 
        NEB3,   16, 
        NEC1,   16, 
        NEC2,   16, 
        NEC3,   16, 
        NRA1,   16, 
        NRA2,   16, 
        NRA3,   16, 
        NMB1,   32, 
        NMB2,   32, 
        NMB3,   32, 
        NMV1,   32, 
        NMV2,   32, 
        NMV3,   32, 
        NPB1,   32, 
        NPB2,   32, 
        NPB3,   32, 
        NPV1,   32, 
        NPV2,   32, 
        NPV3,   32, 
        NRP1,   32, 
        NRP2,   32, 
        NRP3,   32, 
        Offset (0x262), 
        SXRB,   32, 
        SXRS,   32, 
        CIOE,   8, 
        CIOI,   8, 
        TAEN,   8, 
        TIRQ,   8, 
        XWMB,   32, 
        EMH4,   8, 
        EMDS,   8, 
        CSKU,   8, 
        ITA0,   16, 
        ITA1,   16, 
        ITA2,   16, 
        ITA3,   16, 
        ITS0,   8, 
        ITS1,   8, 
        ITS2,   8, 
        ITS3,   8, 
        PMBS,   16, 
        PWRM,   32
    }

    Scope (_SB)
    {
        Name (GPCL, Package (0x08)
        {
            Package (0x06)
            {
                0x00AF0000, 
                0x18, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }, 

            Package (0x06)
            {
                0x00AF0000, 
                0x18, 
                0x04C0, 
                0xD4, 
                0x30, 
                0x0144
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x04C0, 
                0xD4, 
                0x30, 
                0x0144
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x0580, 
                0xD8, 
                0x40, 
                0x0148
            }, 

            Package (0x06)
            {
                0x00AC0000, 
                0x18, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }, 

            Package (0x06)
            {
                0x00AC0000, 
                0x08, 
                0x04C0, 
                0xD4, 
                0x30, 
                0x0144
            }, 

            Package (0x06)
            {
                0x00AD0000, 
                0x0C, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }
        })
        Name (GPCH, Package (0x0A)
        {
            Package (0x06)
            {
                0x00AF0000, 
                0x18, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }, 

            Package (0x06)
            {
                0x00AF0000, 
                0x18, 
                0x04C0, 
                0xD4, 
                0x2C, 
                0x0144
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x04C0, 
                0xD4, 
                0x2C, 
                0x0144
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x0D, 
                0x0580, 
                0xD8, 
                0x38, 
                0x0148
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x05E8, 
                0xDC, 
                0x40, 
                0x014C
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x06A8, 
                0xE0, 
                0x4C, 
                0x0150
            }, 

            Package (0x06)
            {
                0x00AE0000, 
                0x18, 
                0x0768, 
                0xE4, 
                0x58, 
                0x0154
            }, 

            Package (0x06)
            {
                0x00AC0000, 
                0x0B, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }, 

            Package (0x06)
            {
                0x00AD0000, 
                0x0C, 
                0x0400, 
                0xD0, 
                0x20, 
                0x0140
            }
        })
        Name (RXEV, Package (0x0A)
        {
            Buffer (0x18){}, 
            Buffer (0x18){}, 
            Buffer (0x18){}, 
            Buffer (0x18){}, 
            Buffer (0x18){}, 
            Buffer (0x18){}, 
            Buffer (0x18){}, 
            Buffer (0x18){}, 
            Buffer (0x0B){}, 
            Buffer (0x0C){}
        })
    }

    Scope (_SB)
    {
        Method (GINF, 2, NotSerialized)
        {
            If ((PCHS == SPTL))
            {
                Return (DerefOf (DerefOf (GPCL [Arg0]) [Arg1]))
            }
            Else
            {
                Return (DerefOf (DerefOf (GPCH [Arg0]) [Arg1]))
            }
        }

        Method (GMXG, 0, NotSerialized)
        {
            If ((PCHS == SPTL))
            {
                Return (0x08)
            }
            Else
            {
                Return (0x0A)
            }
        }

        Method (GADR, 2, NotSerialized)
        {
            Local0 = (GINF (Arg0, Zero) + SBRG)
            Local1 = GINF (Arg0, Arg1)
            Return ((Local0 + Local1))
        }

        Method (GNUM, 1, NotSerialized)
        {
            Local0 = GNMB (Arg0)
            Local1 = GGRP (Arg0)
            Return ((Local0 + (Local1 * 0x18)))
        }

        Method (INUM, 1, NotSerialized)
        {
            Local1 = GNMB (Arg0)
            Local2 = GGRP (Arg0)
            Local3 = Zero
            While ((Local3 < Local2))
            {
                Local1 += GINF (Local3, One)
                Local3++
            }

            Return ((0x18 + (Local1 % 0x60)))
        }

        Method (GGRP, 1, Serialized)
        {
            Local0 = ((Arg0 & 0x00FF0000) >> 0x10)
            Return (Local0)
        }

        Method (GNMB, 1, Serialized)
        {
            Return ((Arg0 & 0xFFFF))
        }

        Method (GGPE, 1, NotSerialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            If ((((GPEM >> (Local0 * 0x02)) & 0x03) == 
                Zero))
            {
                Return (0x6F)
            }
            Else
            {
                Local2 = ((GPEM >> (Local0 * 0x02)) & 0x03)
                Return ((((Local2 - One) * 0x20) + Local1))
            }
        }

        Method (GPC0, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            Return (TEMP) /* \_SB_.GPC0.TEMP */
        }

        Method (SPC0, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            TEMP = Arg1
        }

        Method (GPC1, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = ((GADR (Local0, 0x02) + (Local1 * 0x08)) + 
                0x04)
            OperationRegion (PDW1, SystemMemory, Local2, 0x04)
            Field (PDW1, AnyAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            Return (TEMP) /* \_SB_.GPC1.TEMP */
        }

        Method (SPC1, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = ((GADR (Local0, 0x02) + (Local1 * 0x08)) + 
                0x04)
            OperationRegion (PDW1, SystemMemory, Local2, 0x04)
            Field (PDW1, AnyAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            TEMP = Arg1
        }

        Method (SRXO, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   28, 
                TEMP,   1, 
                Offset (0x04)
            }

            TEMP = Arg1
        }

        Method (GGIV, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   1, 
                TEMP,   1, 
                Offset (0x04)
            }

            Return (TEMP) /* \_SB_.GGIV.TEMP */
        }

        Method (GGOV, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                TEMP,   1, 
                Offset (0x04)
            }

            Return (TEMP) /* \_SB_.GGOV.TEMP */
        }

        Method (SGOV, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                TEMP,   1, 
                Offset (0x04)
            }

            TEMP = Arg1
        }

        Method (GGII, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   23, 
                TEMP,   1, 
                Offset (0x04)
            }

            Return (TEMP) /* \_SB_.GGII.TEMP */
        }

        Method (SGII, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   23, 
                TEMP,   1, 
                Offset (0x04)
            }

            TEMP = Arg1
        }

        Method (GPMV, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   10, 
                TEMP,   3, 
                Offset (0x04)
            }

            Return (TEMP) /* \_SB_.GPMV.TEMP */
        }

        Method (SPMV, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   10, 
                TEMP,   3, 
                Offset (0x04)
            }

            TEMP = Arg1
        }

        Method (GHPO, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local3 = (GADR (Local0, 0x03) + ((Local1 >> 0x05) * 0x04))
            Local4 = (Local1 & 0x1F)
            OperationRegion (PREG, SystemMemory, Local3, 0x04)
            Field (PREG, AnyAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            Return (((TEMP >> Local4) & One))
        }

        Method (SHPO, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local3 = (GADR (Local0, 0x03) + ((Local1 >> 0x05) * 0x04))
            Local4 = (Local1 & 0x1F)
            OperationRegion (PREG, SystemMemory, Local3, 0x04)
            Field (PREG, AnyAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            If (Arg1)
            {
                TEMP |= (One << Local4)
            }
            Else
            {
                TEMP &= ~(One << Local4)
            }
        }

        Method (GGPO, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x04) + ((Local1 >> 0x03) * 0x04
                ))
            OperationRegion (PREG, SystemMemory, Local2, 0x04)
            Field (PREG, AnyAcc, NoLock, Preserve)
            {
                TEMP,   32
            }

            Return (((TEMP >> ((Local1 & 0x07) * 0x04)) & 
                0x03))
        }

        Method (SGRA, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   20, 
                TEMP,   1, 
                Offset (0x04)
            }

            TEMP = Arg1
        }

        Method (SGWP, 2, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = ((GADR (Local0, 0x02) + (Local1 * 0x08)) + 
                0x04)
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   10, 
                TEMP,   4, 
                Offset (0x04)
            }

            TEMP = Arg1
        }

        Method (UGPS, 0, Serialized)
        {
        }

        Method (CGPS, 0, Serialized)
        {
        }

        Method (CGLS, 0, Serialized)
        {
        }

        Method (CAGS, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local4 = ((Local1 >> 0x05) * 0x04)
            If ((((GPEM >> (Local0 * 0x02)) & 0x03) == 
                Zero))
            {
                OperationRegion (GPPX, SystemMemory, (GADR (Local0, 0x05) + Local4), 0x04)
                Field (GPPX, AnyAcc, NoLock, Preserve)
                {
                    STSX,   32
                }

                Local2 = (One << (Local1 % 0x20))
                STSX = Local2
            }
        }

        Method (ISME, 1, NotSerialized)
        {
            If ((((GPEM >> (Arg0 * 0x02)) & 0x03
                ) != Zero))
            {
                Return (Zero)
            }

            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x05) + ((Local1 >> 0x05) * 0x04))
            Local3 = (Local1 & 0x1F)
            OperationRegion (GPPX, SystemMemory, Local2, 0x24)
            Field (GPPX, AnyAcc, NoLock, Preserve)
            {
                STSX,   32, 
                Offset (0x20), 
                GENX,   32
            }

            Return ((((STSX & GENX) >> Local3) & One))
        }

        Method (DIPI, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   9, 
                RDIS,   1, 
                    ,   15, 
                RCFG,   2, 
                Offset (0x04)
            }

            If ((RCFG != 0x02))
            {
                DerefOf (RXEV [Local0]) [Local1] = RCFG /* \_SB_.DIPI.RCFG */
                RCFG = 0x02
                RDIS = One
            }
        }

        Method (UIPI, 1, Serialized)
        {
            Local0 = GGRP (Arg0)
            Local1 = GNMB (Arg0)
            Local2 = (GADR (Local0, 0x02) + (Local1 * 0x08))
            OperationRegion (PDW0, SystemMemory, Local2, 0x04)
            Field (PDW0, AnyAcc, NoLock, Preserve)
            {
                    ,   9, 
                RDIS,   1, 
                    ,   15, 
                RCFG,   2, 
                Offset (0x04)
            }

            Local3 = DerefOf (DerefOf (RXEV [Local0]) [Local1])
            If ((Local3 != 0x02))
            {
                RDIS = Zero
                RCFG = Local3
            }
        }
    }

    Scope (\)
    {
        Method (THEN, 0, Serialized)
        {
            OperationRegion (THBA, SystemMemory, 0xFE200000, 0x10)
            Field (THBA, DWordAcc, NoLock, Preserve)
            {
                DO00,   32
            }

            Return ((DO00 != 0xFFFFFFFF))
        }

        Method (THDA, 2, Serialized)
        {
            Local0 = 0xFE200000
            Local0 += (0x40 * (0x80 * (Arg0 - 0x20)))
            Local0 += (0x40 * Arg1)
            Return (Local0)
        }

        Method (STRD, 3, Serialized)
        {
            If (((Arg1 + Arg2) > SizeOf (Arg0)))
            {
                Return (Zero)
            }

            ToBuffer (Arg0, Local3)
            Local0 = Zero
            Local1 = Zero
            While ((Local1 < Arg2))
            {
                Local2 = DerefOf (Local3 [(Arg1 + Local1)])
                Local0 += (Local2 << (0x08 * Local1))
                Local1++
            }

            Return (Local0)
        }

        Method (THDS, 1, Serialized)
        {
            If (!THEN ())
            {
                Return (Zero)
            }

            Concatenate (Arg0, "\n", Local2)
            Local0 = SizeOf (Local2)
            Local1 = THDA (0x20, 0x16)
            OperationRegion (THBA, SystemMemory, Local1, 0x40)
            Field (THBA, QWordAcc, NoLock, Preserve)
            {
                QO00,   64
            }

            Field (THBA, DWordAcc, NoLock, Preserve)
            {
                DO00,   32, 
                Offset (0x10), 
                DO10,   32, 
                Offset (0x30), 
                DO30,   32
            }

            Field (THBA, WordAcc, NoLock, Preserve)
            {
                WO00,   16
            }

            Field (THBA, ByteAcc, NoLock, Preserve)
            {
                BO00,   8
            }

            DO10 = 0x01000242
            WO00 = Local0
            Local6 = Zero
            Local7 = Local0
            While ((Local7 >= 0x08))
            {
                QO00 = STRD (Local2, Local6, 0x08)
                Local6 += 0x08
                Local7 -= 0x08
            }

            If ((Local7 >= 0x04))
            {
                DO00 = STRD (Local2, Local6, 0x04)
                Local6 += 0x04
                Local7 -= 0x04
            }

            If ((Local7 >= 0x02))
            {
                WO00 = STRD (Local2, Local6, 0x02)
                Local6 += 0x02
                Local7 -= 0x02
            }

            If ((Local7 >= One))
            {
                BO00 = STRD (Local2, Local6, One)
                Local6 += One
                Local7 -= One
            }

            DO30 = Zero
        }

        Method (THDH, 1, Serialized)
        {
            THDS (ToHexString (Arg0))
        }

        Method (THDD, 1, Serialized)
        {
            THDS (ToDecimalString (Arg0))
        }
    }

    Name (SPTH, One)
    Name (SPTL, 0x02)
    Method (PCHV, 0, NotSerialized)
    {
        If ((PCHS == One))
        {
            Return (SPTH) /* \SPTH */
        }

        If ((PCHS == 0x02))
        {
            Return (SPTL) /* \SPTL */
        }

        Return (Zero)
    }

    Scope (_GPE)
    {
        Method (_L6D, 0, Serialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            \_SB.PCI0.XHC.GPEH ()
            \_SB.PCI0.HDAS.GPEH ()
            \_SB.PCI0.GLAN.GPEH ()
            \_SB.PCI0.XDCI.GPEH ()
        }
    }

    Scope (_SB.PCI0)
    {
        Name (TEMP, Zero)
        Device (PRRE)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, "PCHRESV")  // _UID: Unique ID
            Name (_STA, 0x03)  // _STA: Status
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x56)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFD,  // ........
                    /* 0008 */  0x00, 0x00, 0xAC, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0xAD, 0xFD, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xB0, 0xFD,  // ........
                    /* 0020 */  0x00, 0x00, 0x50, 0x00, 0x86, 0x09, 0x00, 0x01,  // ..P.....
                    /* 0028 */  0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x02, 0x00,  // ........
                    /* 0030 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x60, 0x03, 0xFE,  // .....`..
                    /* 0038 */  0x00, 0x60, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // .`......
                    /* 0040 */  0x00, 0xD0, 0x03, 0xFE, 0x00, 0x30, 0x3C, 0x00,  // .....0<.
                    /* 0048 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x41, 0xFE,  // ......A.
                    /* 0050 */  0x00, 0x00, 0x3F, 0x00, 0x79, 0x00               // ..?.y.
                })
                Return (BUF0) /* \_SB_.PCI0.PRRE._CRS.BUF0 */
            }
        }

        Device (IOTR)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, "IoTraps")  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    }
                Name (BUF0, Buffer (0x0A)
                {
                    /* 0000 */  0x47, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF,  // G.......
                    /* 0008 */  0x79, 0x00                                       // y.
                })
                Name (BUF1, Buffer (0x0A)
                {
                    /* 0000 */  0x47, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF,  // G.......
                    /* 0008 */  0x79, 0x00                                       // y.
                })
                Name (BUF2, Buffer (0x0A)
                {
                    /* 0000 */  0x47, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF,  // G.......
                    /* 0008 */  0x79, 0x00                                       // y.
                })
                Name (BUF3, Buffer (0x0A)
                {
                    /* 0000 */  0x47, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF,  // G.......
                    /* 0008 */  0x79, 0x00                                       // y.
                })
                CreateWordField (BUF0, 0x02, AMI0)
                CreateWordField (BUF0, 0x04, AMA0)
                CreateWordField (BUF1, 0x02, AMI1)
                CreateWordField (BUF1, 0x04, AMA1)
                CreateWordField (BUF2, 0x02, AMI2)
                CreateWordField (BUF2, 0x04, AMA2)
                CreateWordField (BUF3, 0x02, AMI3)
                CreateWordField (BUF3, 0x04, AMA3)
                AMI0 = ITA0 /* \ITA0 */
                AMA0 = ITA0 /* \ITA0 */
                AMI1 = ITA1 /* \ITA1 */
                AMA1 = ITA1 /* \ITA1 */
                AMI2 = ITA2 /* \ITA2 */
                AMA2 = ITA2 /* \ITA2 */
                AMI3 = ITA3 /* \ITA3 */
                AMA3 = ITA3 /* \ITA3 */
                If ((ITS0 == One))
                {
                    ConcatenateResTemplate (Local0, BUF0, Local1)
                    Local0 = Local1
                }

                If ((ITS1 == One))
                {
                    ConcatenateResTemplate (Local0, BUF1, Local1)
                    Local0 = Local1
                }

                If ((ITS2 == One))
                {
                    ConcatenateResTemplate (Local0, BUF2, Local1)
                    Local0 = Local1
                }

                If ((ITS3 == One))
                {
                    ConcatenateResTemplate (Local0, BUF3, Local1)
                    Local0 = Local1
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If (PCIC (Arg0))
            {
                Return (PCID (Arg0, Arg1, Arg2, Arg3))
            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }

        OperationRegion (LPC, PCI_Config, Zero, 0x0100)
        Field (LPC, AnyAcc, NoLock, Preserve)
        {
            Offset (0x02), 
            CDID,   16, 
            Offset (0x08), 
            CRID,   8, 
            Offset (0x80), 
            IOD0,   8, 
            IOD1,   8, 
            Offset (0xA0), 
                ,   9, 
            PRBL,   1, 
            Offset (0xDC), 
                ,   2, 
            ESPI,   1
        }
    }

    Scope (_SB.PCI0)
    {
        Device (PPMC)
        {
            Name (_ADR, 0x001F0002)  // _ADR: Address
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }

        Device (SBUS)
        {
            Name (_ADR, 0x001F0004)  // _ADR: Address
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (_SB)
    {
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PARC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLA, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLA, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PARC & 0x0F))
                Return (RTLA) /* \_SB_.LNKA._CRS.RTLA */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PARC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PARC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PBRC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB) /* \_SB_.PRSB */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLB, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLB, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PBRC & 0x0F))
                Return (RTLB) /* \_SB_.LNKB._CRS.RTLB */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PBRC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PBRC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PCRC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC) /* \_SB_.PRSC */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLC, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLC, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PCRC & 0x0F))
                Return (RTLC) /* \_SB_.LNKC._CRS.RTLC */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PCRC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PCRC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PDRC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD) /* \_SB_.PRSD */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLD, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLD, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PDRC & 0x0F))
                Return (RTLD) /* \_SB_.LNKD._CRS.RTLD */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PDRC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PDRC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PERC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE) /* \_SB_.PRSE */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLE, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLE, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PERC & 0x0F))
                Return (RTLE) /* \_SB_.LNKE._CRS.RTLE */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PERC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PERC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PFRC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF) /* \_SB_.PRSF */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLF, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLF, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PFRC & 0x0F))
                Return (RTLF) /* \_SB_.LNKF._CRS.RTLF */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PFRC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PFRC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PGRC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG) /* \_SB_.PRSG */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLG, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLG, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PGRC & 0x0F))
                Return (RTLG) /* \_SB_.LNKG._CRS.RTLG */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PGRC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PGRC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_DIS, 0, Serialized)  // _DIS: Disable Device
            {
                PHRC |= 0x80
            }

            Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH) /* \_SB_.PRSH */
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RTLH, Buffer (0x06)
                {
                     0x23, 0x00, 0x00, 0x18, 0x79, 0x00               // #...y.
                })
                CreateWordField (RTLH, One, IRQ0)
                IRQ0 = Zero
                IRQ0 = (One << (PHRC & 0x0F))
                Return (RTLH) /* \_SB_.LNKH._CRS.RTLH */
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Local0--
                PHRC = Local0
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If ((PHRC & 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }
    }

    Scope (\)
    {
        Method (PCRR, 2, Serialized)
        {
            Local0 = ((Arg0 << 0x10) + Arg1)
            Local0 += SBRG
            OperationRegion (PCR0, SystemMemory, Local0, 0x04)
            Field (PCR0, DWordAcc, Lock, Preserve)
            {
                DAT0,   32
            }

            Return (DAT0) /* \PCRR.DAT0 */
        }

        Method (PCRW, 3, Serialized)
        {
            Local0 = ((Arg0 << 0x10) + Arg1)
            Local0 += SBRG
            OperationRegion (PCR0, SystemMemory, Local0, 0x04)
            Field (PCR0, DWordAcc, Lock, Preserve)
            {
                DAT0,   32
            }

            DAT0 = Arg2
            Local0 = PCRR (0xC7, 0x3418)
        }

        Method (PCRO, 3, Serialized)
        {
            Local0 = PCRR (Arg0, Arg1)
            Local1 = (Local0 | Arg2)
            PCRW (Arg0, Arg1, Local1)
        }

        Method (PCRA, 3, Serialized)
        {
            Local0 = PCRR (Arg0, Arg1)
            Local1 = (Local0 & Arg2)
            PCRW (Arg0, Arg1, Local1)
        }

        Method (PCAO, 4, Serialized)
        {
            Local0 = PCRR (Arg0, Arg1)
            Local1 = ((Local0 & Arg2) | Arg3)
            PCRW (Arg0, Arg1, Local1)
        }

        Name (TCBV, Zero)
        Method (TCBS, 0, NotSerialized)
        {
            If ((TCBV == Zero))
            {
                Local0 = PCRR (0xEF, 0x2778)
                TCBV = (Local0 & 0xFFE0)
            }

            Return (TCBV) /* \TCBV */
        }

        OperationRegion (PMIO, SystemIO, PMBS, 0x60)
        Field (PMIO, ByteAcc, NoLock, Preserve)
        {
            Offset (0x01), 
            PBSS,   1, 
            Offset (0x40), 
                ,   17, 
            GPEC,   1
        }

        OperationRegion (TCBA, SystemIO, TCBS (), 0x10)
        Field (TCBA, ByteAcc, NoLock, Preserve)
        {
            Offset (0x04), 
                ,   9, 
            CPSC,   1
        }

        OperationRegion (PWMR, SystemMemory, PWRM, 0x0800)
        Field (PWMR, AnyAcc, NoLock, Preserve)
        {
            Offset (0xE0), 
            Offset (0xE2), 
            DWLE,   1, 
            HWLE,   1, 
            Offset (0x31C), 
                ,   13, 
            SLS0,   1, 
                ,   8, 
            XSQD,   1
        }

        OperationRegion (PMST, SystemMemory, PWRM, 0x80)
        Field (PMST, DWordAcc, NoLock, Preserve)
        {
            Offset (0x18), 
                ,   25, 
            USBP,   1, 
            Offset (0x1C), 
            Offset (0x1F), 
            PMFS,   1, 
            Offset (0x20), 
            MPMC,   32, 
                ,   20, 
            UWAB,   1
        }
    }

    Scope (_SB.PCI0)
    {
        Name (LTRZ, Zero)
        Name (OBFZ, Zero)
        Name (LMSL, Zero)
        Name (LNSL, Zero)
        Device (GLAN)
        {
            Name (_ADR, 0x001F0006)  // _ADR: Address
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            OperationRegion (GLBA, PCI_Config, Zero, 0x0100)
            Field (GLBA, AnyAcc, NoLock, Preserve)
            {
                DVID,   16
            }

            Field (GLBA, ByteAcc, NoLock, Preserve)
            {
                Offset (0xCC), 
                Offset (0xCD), 
                PMEE,   1, 
                    ,   6, 
                PMES,   1
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x6D, 0x04))
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                PMEE = Arg0
            }

            Method (GPEH, 0, NotSerialized)
            {
                If ((DVID == 0xFFFF))
                {
                    Return (Zero)
                }

                If ((PMEE && PMES))
                {
                    PMES = One
                    Notify (GLAN, 0x02) // Device Wake
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (XHC)
        {
            Name (_ADR, 0x00140000)  // _ADR: Address
            OperationRegion (XPRT, PCI_Config, Zero, 0x0100)
            Field (XPRT, AnyAcc, NoLock, Preserve)
            {
                DVID,   16, 
                Offset (0x10), 
                XADL,   32, 
                XADH,   32, 
                Offset (0x50), 
                    ,   2, 
                STGE,   1, 
                Offset (0xA2), 
                    ,   2, 
                D3HE,   1
            }

            Field (XPRT, ByteAcc, NoLock, Preserve)
            {
                Offset (0x74), 
                D0D3,   2, 
                Offset (0x75), 
                PMEE,   1, 
                    ,   6, 
                PMES,   1
            }

            Name (XFLT, Zero)
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                ADBG ("_DSM")
                Local0 = (XADH << 0x20)
                Local0 |= XADL /* \_SB_.PCI0.XHC_.XADL */
                Local0 &= 0xFFFFFFFFFFFFFFF0
                OperationRegion (XMIO, SystemMemory, Local0, 0x9000)
                Field (XMIO, AnyAcc, Lock, Preserve)
                {
                    Offset (0x550), 
                    PCCS,   1, 
                        ,   4, 
                    PPLS,   4, 
                    PTPP,   1, 
                    Offset (0x8420), 
                    PRTM,   2
                }

                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                If ((Arg0 == ToUUID ("ac340cb7-e901-45bf-b7e6-2b34ec931e23") /* Unknown UUID */))
                {
                    If ((Arg1 == 0x03))
                    {
                        XFLT = Arg1
                    }

                    If (((PRTM > Zero) && ((Arg1 == 0x05) || (Arg1 == 0x06))))
                    {
                        ADBG ("SSIC")
                        If ((((PCCS == Zero) || (PTPP == Zero)) || ((
                            PPLS >= 0x04) && (PPLS <= 0x0F))))
                        {
                            If ((PPLS == 0x08))
                            {
                                D3HE = One
                            }
                            Else
                            {
                                D3HE = Zero
                            }
                        }
                        Else
                        {
                            D3HE = One
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                Return (0x03)
            }

            Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
            {
                Return (0x03)
            }

            Method (_S3W, 0, NotSerialized)  // _S3W: S3 Device Wake State
            {
                Return (0x03)
            }

            Method (_S4W, 0, NotSerialized)  // _S4W: S4 Device Wake State
            {
                Return (0x03)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((XFLT == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x6D, 0x03))
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                PMEE = Arg0
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (CondRefOf (\_SB.PCI0.XHC.RHUB.INIR))
                {
                    ^RHUB.INIR ()
                }
            }

            Method (GPEH, 0, NotSerialized)
            {
                If ((DVID == 0xFFFF))
                {
                    Return (Zero)
                }

                Local0 = PMES /* \_SB_.PCI0.XHC_.PMES */
                PMES = One
                If ((PMEE && Local0))
                {
                    Notify (XHC, 0x02) // Device Wake
                }
            }

            OperationRegion (XHCP, SystemMemory, (GPCB () + 0x000A0000), 0x0100)
            Field (XHCP, AnyAcc, Lock, Preserve)
            {
                Offset (0x04), 
                PDBM,   16, 
                Offset (0x10), 
                MEMB,   64
            }

            Method (USRA, 0, Serialized)
            {
                If ((PCHV () == SPTH))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (SSPA, 0, Serialized)
            {
                If ((PCHV () == SPTH))
                {
                    Return (0x11)
                }
                Else
                {
                    Return (0x0D)
                }
            }

            Name (XRST, Zero)
            Method (_PS0, 0, Serialized)  // _PS0: Power State 0
            {
                If ((DVID == 0xFFFF))
                {
                    Return (Zero)
                }

                Local2 = MEMB /* \_SB_.PCI0.XHC_.MEMB */
                Local1 = PDBM /* \_SB_.PCI0.XHC_.PDBM */
                PDBM &= 0xFFFFFFFFFFFFFFF9
                D3HE = Zero
                STGE = Zero
                D0D3 = Zero
                MEMB = XWMB /* \XWMB */
                PDBM = (Local1 | 0x02)
                OperationRegion (MC11, SystemMemory, XWMB, 0x9000)
                Field (MC11, DWordAcc, Lock, Preserve)
                {
                    Offset (0x81C4), 
                        ,   2, 
                    UPSW,   2
                }

                UPSW = Zero
                PDBM &= 0xFFFFFFFFFFFFFFFD
                MEMB = Local2
                PDBM = Local1
                If (CondRefOf (\_SB.PCI0.XHC.PS0X))
                {
                    PS0X ()
                }

                If ((UWAB && ((D0D3 == Zero) || (^^XDCI.D0I3 == Zero))))
                {
                    MPMC = One
                    While (PMFS)
                    {
                        Sleep (0x0A)
                    }
                }
            }

            Method (_PS3, 0, Serialized)  // _PS3: Power State 3
            {
                If ((DVID == 0xFFFF))
                {
                    Return (Zero)
                }

                Local2 = MEMB /* \_SB_.PCI0.XHC_.MEMB */
                Local1 = PDBM /* \_SB_.PCI0.XHC_.PDBM */
                PDBM &= 0xFFFFFFFFFFFFFFF9
                D0D3 = Zero
                MEMB = XWMB /* \XWMB */
                PDBM = (Local1 | 0x02)
                OperationRegion (MC11, SystemMemory, XWMB, 0x9000)
                Field (MC11, DWordAcc, Lock, Preserve)
                {
                    Offset (0x81C4), 
                        ,   2, 
                    UPSW,   2
                }

                Name (U3PS, Zero)
                If ((PCHV () == SPTL))
                {
                    U3PS = 0x0540
                }
                Else
                {
                    U3PS = 0x0580
                }

                OperationRegion (UPSC, SystemMemory, (XWMB + U3PS), 0x0100)
                Field (UPSC, DWordAcc, Lock, Preserve)
                {
                    Offset (0x03), 
                    CAS1,   1, 
                    Offset (0x10), 
                    Offset (0x13), 
                    CAS2,   1, 
                    Offset (0x20), 
                    Offset (0x23), 
                    CAS3,   1, 
                    Offset (0x30), 
                    Offset (0x33), 
                    CAS4,   1, 
                    Offset (0x40), 
                    Offset (0x43), 
                    CAS5,   1, 
                    Offset (0x50), 
                    Offset (0x53), 
                    CAS6,   1, 
                    Offset (0x60), 
                    Offset (0x63), 
                    CAS7,   1, 
                    Offset (0x70), 
                    Offset (0x73), 
                    CAS8,   1, 
                    Offset (0x80), 
                    Offset (0x83), 
                    CAS9,   1, 
                    Offset (0x90), 
                    Offset (0x93), 
                    CASA,   1
                }

                UPSW = 0x03
                STGE = One
                If (((((((CAS1 || CAS2) || CAS3) || CAS4) || CAS5) || 
                    CAS6) || ((PCHV () == SPTH) && (((CAS7 || CAS8) || CAS9) || CASA))))
                {
                    D3HE = Zero
                    Sleep (0x0A)
                }
                Else
                {
                    D3HE = One
                }

                PDBM &= 0xFFFFFFFFFFFFFFFD
                D0D3 = 0x03
                MEMB = Local2
                PDBM = Local1
                If (CondRefOf (\_SB.PCI0.XHC.PS3X))
                {
                    PS3X ()
                }

                If ((UWAB && ((D0D3 == 0x03) && ((^^XDCI.D0I3 == 0x03) || (
                    ^^XDCI.DVID == 0xFFFF)))))
                {
                    MPMC = 0x03
                    While (PMFS)
                    {
                        Sleep (0x0A)
                    }
                }
            }

            Method (CUID, 1, Serialized)
            {
                If ((Arg0 == ToUUID ("7c9512a9-1705-4cb4-af7d-506a2423ab71") /* Unknown UUID */))
                {
                    Return (One)
                }

                Return (Zero)
            }

            Device (RHUB)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_PS0, 0, Serialized)  // _PS0: Power State 0
                {
                    If ((DVID == 0xFFFF))
                    {
                        Return (Zero)
                    }

                    If (CondRefOf (\_SB.PCI0.XHC.RHUB.PS0X))
                    {
                        PS0X ()
                    }
                }

                Method (_PS2, 0, Serialized)  // _PS2: Power State 2
                {
                    If ((DVID == 0xFFFF))
                    {
                        Return (Zero)
                    }

                    If (CondRefOf (\_SB.PCI0.XHC.RHUB.PS2X))
                    {
                        PS2X ()
                    }
                }

                Method (_PS3, 0, Serialized)  // _PS3: Power State 3
                {
                    If ((DVID == 0xFFFF))
                    {
                        Return (Zero)
                    }

                    If (CondRefOf (\_SB.PCI0.XHC.RHUB.PS3X))
                    {
                        PS3X ()
                    }
                }

                Device (HS01)
                {
                    Name (_ADR, One)  // _ADR: Address
                }

                Device (HS02)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (HS03)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                }

                Device (HS04)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                }

                Device (HS05)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                }

                Device (HS06)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (HS07)
                {
                    Name (_ADR, 0x07)  // _ADR: Address
                }

                Device (HS08)
                {
                    Name (_ADR, 0x08)  // _ADR: Address
                }

                Device (HS09)
                {
                    Name (_ADR, 0x09)  // _ADR: Address
                }

                Device (HS10)
                {
                    Name (_ADR, 0x0A)  // _ADR: Address
                }

                Device (USR1)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((USRA () + Zero))
                    }
                }

                Device (USR2)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((USRA () + One))
                    }
                }

                Device (SS01)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((SSPA () + Zero))
                    }
                }

                Device (SS02)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((SSPA () + One))
                    }
                }

                Device (SS03)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((SSPA () + 0x02))
                    }
                }

                Device (SS04)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((SSPA () + 0x03))
                    }
                }

                Device (SS05)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((SSPA () + 0x04))
                    }
                }

                Device (SS06)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return ((SSPA () + 0x05))
                    }
                }
            }
        }
    }

    If ((PCHV () == SPTH))
    {
        Scope (_SB.PCI0.XHC.RHUB)
        {
            Device (HS11)
            {
                Name (_ADR, 0x0B)  // _ADR: Address
            }

            Device (HS12)
            {
                Name (_ADR, 0x0C)  // _ADR: Address
            }

            Device (HS13)
            {
                Name (_ADR, 0x0D)  // _ADR: Address
            }

            Device (HS14)
            {
                Name (_ADR, 0x0E)  // _ADR: Address
            }

            Device (SS07)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return ((SSPA () + 0x06))
                }
            }

            Device (SS08)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return ((SSPA () + 0x07))
                }
            }

            Device (SS09)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return ((SSPA () + 0x08))
                }
            }

            Device (SS10)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return ((SSPA () + 0x09))
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (XDCI)
        {
            Name (_ADR, 0x00140001)  // _ADR: Address
            OperationRegion (OTGD, PCI_Config, Zero, 0x0100)
            Field (OTGD, DWordAcc, NoLock, Preserve)
            {
                DVID,   16, 
                Offset (0x10), 
                XDCB,   64
            }

            Field (OTGD, ByteAcc, NoLock, Preserve)
            {
                Offset (0x84), 
                D0I3,   2, 
                Offset (0x85), 
                PMEE,   1, 
                    ,   6, 
                PMES,   1
            }

            Method (XDBA, 0, NotSerialized)
            {
                Return ((XDCB & 0xFFFFFFFFFFFFFF00))
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                If ((Arg0 == ToUUID ("732b85d5-b7a7-4a1b-9ba0-4bbd00ffd511") /* Unknown UUID */))
                {
                    If ((Arg1 == One))
                    {
                        Method (SPPS, 2, Serialized)
                        {
                            OperationRegion (XDBW, SystemMemory, XDBA (), 0x00110000)
                            Field (XDBW, WordAcc, NoLock, Preserve)
                            {
                                Offset (0x10F810), 
                                Offset (0x10F811), 
                                U2CP,   2, 
                                U3CP,   2, 
                                Offset (0x10F818), 
                                PUPS,   2, 
                                    ,   1, 
                                PURC,   1, 
                                Offset (0x10F81A), 
                                Offset (0x10F81C), 
                                    ,   3, 
                                UXPE,   2, 
                                Offset (0x10F81E)
                            }

                            Local1 = Arg0
                            Local2 = Arg1
                            If ((Local1 == Zero))
                            {
                                UXPE = Zero
                                Local0 = Zero
                                While ((Local0 < 0x0A))
                                {
                                    Stall (0x64)
                                    Local0++
                                }

                                PUPS = Zero
                                Local0 = Zero
                                While ((Local0 < 0x07D0))
                                {
                                    Stall (0x64)
                                    If (((U2CP == Zero) && (U3CP == Zero)))
                                    {
                                        Break
                                    }

                                    Local0++
                                }

                                If ((U2CP != Zero)){}
                                If ((U3CP != Zero)){}
                                Return (Zero)
                            }

                            If ((Local1 == 0x03))
                            {
                                If ((U2CP != Zero)){}
                                If ((U3CP != Zero)){}
                                PUPS = 0x03
                                Local0 = Zero
                                While ((Local0 < 0x07D0))
                                {
                                    Stall (0x64)
                                    If (((U2CP == 0x03) && (U3CP == 0x03)))
                                    {
                                        Break
                                    }

                                    Local0++
                                }

                                If ((U2CP != 0x03)){}
                                If ((U3CP != 0x03)){}
                                UXPE = Local2
                                Return (Zero)
                            }

                            Return (Zero)
                        }

                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Return (Buffer (One)
                                {
                                     0xF3                                             // .
                                })
                            }
                            Case (One)
                            {
                                Return (One)
                            }
                            Case (0x04)
                            {
                                Local1 = DerefOf (Arg3 [Zero])
                                SPPS (Local1, Zero)
                            }
                            Case (0x05)
                            {
                                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.XDAT))
                                {
                                    If ((^^LPCB.H_EC.XDAT () == One))
                                    {
                                        Notify (XDCI, 0x80) // Status Change
                                    }
                                    Else
                                    {
                                        Notify (XDCI, 0x81) // Information Change
                                    }
                                }

                                Return (Zero)
                            }
                            Case (0x06)
                            {
                                OperationRegion (XDBD, SystemMemory, XDBA (), 0x00110000)
                                Field (XDBD, DWordAcc, NoLock, Preserve)
                                {
                                    Offset (0xC704), 
                                        ,   30, 
                                    CSFR,   1, 
                                    Offset (0xC708)
                                }

                                OperationRegion (XDW2, SystemMemory, XDBA (), 0x00110000)
                                Field (XDW2, WordAcc, NoLock, Preserve)
                                {
                                    Offset (0x10F820), 
                                        ,   13, 
                                    OTHC,   1
                                }

                                If ((OTHC == Zero))
                                {
                                    CSFR = One
                                    Local0 = Zero
                                    While ((Local0 < 0x64))
                                    {
                                        If ((CSFR == Zero))
                                        {
                                            Break
                                        }

                                        Sleep (One)
                                    }
                                }

                                Return (Zero)
                            }
                            Case (0x07)
                            {
                                OperationRegion (XD22, SystemMemory, XDBA (), 0x00110000)
                                Field (XD22, WordAcc, NoLock, Preserve)
                                {
                                    Offset (0x10F818), 
                                    P2PS,   2, 
                                    Offset (0x10F81A)
                                }

                                Local0 = P2PS /* \_SB_.PCI0.XDCI._DSM.P2PS */
                                Return (Local0)
                            }

                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Name (_DDN, "SPT XHCI controller")  // _DDN: DOS Device Name
            Name (_STR, Unicode ("SPT XHCI controller"))  // _STR: Description String
            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                Return (0x03)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((DVID != 0xFFFFFFFF))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x6D, 0x04))
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                PMEE = Arg0
            }

            Method (GPEH, 0, NotSerialized)
            {
                If ((DVID == 0xFFFF))
                {
                    Return (Zero)
                }

                Local0 = PMES /* \_SB_.PCI0.XDCI.PMES */
                PMES = One
                If ((PMEE && Local0))
                {
                    Notify (XDCI, 0x02) // Device Wake
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (HDAS)
        {
            Name (_ADR, 0x001F0003)  // _ADR: Address
            OperationRegion (HDAR, PCI_Config, Zero, 0x0100)
            Field (HDAR, WordAcc, NoLock, Preserve)
            {
                VDID,   32, 
                CMD,    8, 
                Offset (0x10), 
                BARL,   32, 
                BARH,   32
            }

            Field (HDAR, ByteAcc, NoLock, Preserve)
            {
                Offset (0x54), 
                Offset (0x55), 
                PMEE,   1, 
                    ,   6, 
                PMES,   1
            }

            Method (GHDA, 1, NotSerialized)
            {
                Local0 = Zero
                If (((CMD & 0x02) && (BARL & 0xFFFFC000)))
                {
                    Local1 = BARH /* \_SB_.PCI0.HDAS.BARH */
                    Local1 <<= 0x20
                    Local1 |= (BARL & 0xFFFFC000)
                    OperationRegion (HDAM, SystemMemory, Local1, 0x70)
                    Field (HDAM, DWordAcc, NoLock, Preserve)
                    {
                        Offset (0x60), 
                        ICR,    32, 
                        IRR,    32, 
                        ICSR,   16
                    }

                    Local7 = 0x03E8
                    While ((((ICSR & One) == One) && (Local7 != Zero)))
                    {
                        Stall (One)
                        Local7--
                    }

                    ICSR |= 0x02
                    Local7 = 0x03E8
                    While ((((ICSR & 0x02) == 0x02) && (Local7 != Zero)))
                    {
                        Stall (One)
                        Local7--
                    }

                    ICR = Arg0
                    ICSR |= One
                    Local7 = 0x03E8
                    While ((((ICSR & 0x03) != 0x02) && (Local7 != 
                        Zero)))
                    {
                        Stall (One)
                        Local7--
                    }

                    If (((ICSR & 0x03) == 0x02))
                    {
                        Local0 = IRR /* \_SB_.PCI0.HDAS.GHDA.IRR_ */
                    }
                }

                Return (Local0)
            }

            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                PMEE = Arg0
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x6D, 0x04))
            }

            Method (GPEH, 0, NotSerialized)
            {
                If ((VDID == 0xFFFFFFFF))
                {
                    Return (Zero)
                }

                If ((PMEE && PMES))
                {
                    ADBG ("HDAS GPEH")
                    PMES = One
                    Notify (HDAS, 0x02) // Device Wake
                }
            }

            Method (_PS0, 0, Serialized)  // _PS0: Power State 0
            {
                If ((VDID != 0xFFFFFFFF))
                {
                    VMMH (Zero, One)
                }

                If (CondRefOf (\_SB.PCI0.HDAS.PS0X))
                {
                    PS0X ()
                }
            }

            Method (_PS3, 0, Serialized)  // _PS3: Power State 3
            {
                If ((VDID != 0xFFFFFFFF))
                {
                    VMMH (Zero, Zero)
                }

                If (CondRefOf (\_SB.PCI0.HDAS.PS3X))
                {
                    PS3X ()
                }
            }

            Name (NBUF, Buffer (0x30)
            {
                /* 0000 */  0x8A, 0x2B, 0x00, 0x00, 0x01, 0x10, 0x01, 0x00,  // .+......
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79, 0x00   // ......y.
            })
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                ADBG ("HDAS _INI")
                CreateQWordField (NBUF, 0x0E, NBAS)
                CreateQWordField (NBUF, 0x16, NMAS)
                CreateQWordField (NBUF, 0x26, NLEN)
                NBAS = NHLA /* \NHLA */
                NMAS = (NHLA + (NHLL - One))
                NLEN = NHLL /* \NHLL */
                If ((VDID != 0xFFFFFFFF))
                {
                    VMMH (Zero, One)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                ADBG ("HDAS _DSM")
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                If ((Arg0 == ToUUID ("a69f886e-6ceb-4594-a41f-7b5dce24c553") /* Unknown UUID */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x0F                                             // .
                            })
                        }
                        Case (One)
                        {
                            ADBG ("_DSM Fun 1 NHLT")
                            Return (NBUF) /* \_SB_.PCI0.HDAS.NBUF */
                        }
                        Case (0x02)
                        {
                            ADBG ("_DSM Fun 2 FMSK")
                            Return (ADFM) /* \ADFM */
                        }
                        Case (0x03)
                        {
                            ADBG ("_DSM Fun 3 PPMS")
                            If (CondRefOf (\_SB.PCI0.HDAS.PPMS))
                            {
                                Return (PPMS (Arg3))
                            }

                            Return (Zero)
                        }
                        Default
                        {
                            ADBG ("_DSM Fun NOK")
                            Return (Buffer (One)
                            {
                                 0x00                                             // .
                            })
                        }

                    }
                }

                If (CondRefOf (HIWC))
                {
                    If (HIWC (Arg0))
                    {
                        If (CondRefOf (HIDW))
                        {
                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }

                ADBG ("_DSM UUID NOK")
                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }

        Device (SAT0)
        {
            Name (_ADR, 0x00170000)  // _ADR: Address
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                If (CondRefOf (\_SB.PCI0.SAT0.SDSM))
                {
                    Return (SDSM (Arg0, Arg1, Arg2, Arg3))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Device (PRT0)
            {
                Name (_ADR, 0xFFFF)  // _ADR: Address
            }

            Device (PRT1)
            {
                Name (_ADR, 0x0001FFFF)  // _ADR: Address
            }

            Device (PRT2)
            {
                Name (_ADR, 0x0002FFFF)  // _ADR: Address
            }

            Device (PRT3)
            {
                Name (_ADR, 0x0003FFFF)  // _ADR: Address
            }

            Device (PRT4)
            {
                Name (_ADR, 0x0004FFFF)  // _ADR: Address
            }

            Device (PRT5)
            {
                Name (_ADR, 0x0005FFFF)  // _ADR: Address
            }

            Device (VOL0)
            {
                Name (_ADR, 0x0080FFFF)  // _ADR: Address
            }

            Device (VOL1)
            {
                Name (_ADR, 0x0081FFFF)  // _ADR: Address
            }

            Device (VOL2)
            {
                Name (_ADR, 0x0082FFFF)  // _ADR: Address
            }

            Method (RDCA, 5, Serialized)
            {
                OperationRegion (RPAL, SystemMemory, (GPCB () + (0x000B8100 + Arg1)), 0x04)
                Field (RPAL, DWordAcc, Lock, Preserve)
                {
                    RPCD,   32
                }

                OperationRegion (EPAC, SystemMemory, (GPCB () + 0x000B8308), 0x08)
                Field (EPAC, DWordAcc, Lock, Preserve)
                {
                    CAIR,   32, 
                    CADR,   32
                }

                OperationRegion (NCRG, SystemMemory, (GPCB () + 0x000B8FC0), 0x04)
                Field (NCRG, DWordAcc, Lock, Preserve)
                {
                    CRGC,   32
                }

                If ((Arg0 > 0x02))
                {
                    Return (Zero)
                }
                Else
                {
                    CRGC = Arg0
                }

                Switch (ToInteger (Arg4))
                {
                    Case (Zero)
                    {
                        Return (RPCD) /* \_SB_.PCI0.SAT0.RDCA.RPCD */
                    }
                    Case (0x02)
                    {
                        CAIR = Arg1
                        Return (CADR) /* \_SB_.PCI0.SAT0.RDCA.CADR */
                    }
                    Case (One)
                    {
                        Local0 = (Arg2 & RPCD) /* \_SB_.PCI0.SAT0.RDCA.RPCD */
                        Local0 |= Arg3
                        RPCD = Local0
                    }
                    Case (0x03)
                    {
                        CAIR = Arg1
                        Local0 = (Arg2 & CADR) /* \_SB_.PCI0.SAT0.RDCA.CADR */
                        Local0 |= Arg3
                        CADR = Local0
                    }
                    Default
                    {
                        Return (Zero)
                    }

                }

                Return (Zero)
            }

            Method (ARPC, 4, Serialized)
            {
                ADBG (Concatenate ("NRPN: ", ToHexString (Arg0)))
                Switch (ToInteger (Arg0))
                {
                    Case (0x04)
                    {
                        If (CondRefOf (\_SB.PCI0.RP05.PWRG))
                        {
                            CopyObject (^^RP05.PWRG, Arg1)
                        }

                        If (CondRefOf (\_SB.PCI0.RP05.RSTG))
                        {
                            CopyObject (^^RP05.RSTG, Arg2)
                        }

                        If (CondRefOf (\_SB.PCI0.RP05.SCLK))
                        {
                            CopyObject (^^RP05.SCLK, Arg3)
                        }
                    }
                    Case (0x08)
                    {
                        If (CondRefOf (\_SB.PCI0.RP09.PWRG))
                        {
                            CopyObject (^^RP09.PWRG, Arg1)
                        }

                        If (CondRefOf (\_SB.PCI0.RP09.RSTG))
                        {
                            CopyObject (^^RP09.RSTG, Arg2)
                        }

                        If (CondRefOf (\_SB.PCI0.RP09.SCLK))
                        {
                            CopyObject (^^RP09.SCLK, Arg3)
                        }
                    }
                    Case (0x0C)
                    {
                        If (CondRefOf (\_SB.PCI0.RP13.PWRG))
                        {
                            CopyObject (^^RP13.PWRG, Arg1)
                        }

                        If (CondRefOf (\_SB.PCI0.RP13.RSTG))
                        {
                            CopyObject (^^RP13.RSTG, Arg2)
                        }

                        If (CondRefOf (\_SB.PCI0.RP13.SCLK))
                        {
                            CopyObject (^^RP13.SCLK, Arg3)
                        }
                    }
                    Case (0x10)
                    {
                        If (CondRefOf (\_SB.PCI0.RP17.PWRG))
                        {
                            CopyObject (^^RP17.PWRG, Arg1)
                        }

                        If (CondRefOf (\_SB.PCI0.RP17.RSTG))
                        {
                            CopyObject (^^RP17.RSTG, Arg2)
                        }

                        If (CondRefOf (\_SB.PCI0.RP17.SCLK))
                        {
                            CopyObject (^^RP17.SCLK, Arg3)
                        }
                    }
                    Default
                    {
                        ADBG (Concatenate ("ERR!NRPN: ", ToHexString (Arg0)))
                    }

                }
            }

            Device (NVM1)
            {
                Name (_ADR, 0x00C1FFFF)  // _ADR: Address
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    NITV = NIT1 /* \NIT1 */
                    NPMV = NPM1 /* \NPM1 */
                    NPCV = NPC1 /* \NPC1 */
                    NL1V = NL11 /* \NL11 */
                    ND2V = ND21 /* \ND21 */
                    ND1V = ND11 /* \ND11 */
                    NLRV = NLR1 /* \NLR1 */
                    NLDV = NLD1 /* \NLD1 */
                    NEAV = NEA1 /* \NEA1 */
                    NEBV = NEB1 /* \NEB1 */
                    NECV = NEC1 /* \NEC1 */
                    NRAV = NRA1 /* \NRA1 */
                    NMBV = NMB1 /* \NMB1 */
                    NMVV = NMV1 /* \NMV1 */
                    NPBV = NPB1 /* \NPB1 */
                    NPVV = NPV1 /* \NPV1 */
                    NRPN = NRP1 /* \NRP1 */
                    NCRN = Zero
                    ARPC (NRPN, RefOf (PWRG), RefOf (RSTG), RefOf (SCLK))
                }

                Name (PRBI, Zero)
                Name (PRBD, Zero)
                Name (PCMD, Zero)
                Name (RSTG, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (PWRG, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (SCLK, Package (0x03)
                {
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (NCRN, Zero)
                Name (NITV, Zero)
                Name (NPMV, Zero)
                Name (NPCV, Zero)
                Name (NL1V, Zero)
                Name (ND2V, Zero)
                Name (ND1V, Zero)
                Name (NLRV, Zero)
                Name (NLDV, Zero)
                Name (NEAV, Zero)
                Name (NEBV, Zero)
                Name (NECV, Zero)
                Name (NRAV, Zero)
                Name (NMBV, Zero)
                Name (NMVV, Zero)
                Name (NPBV, Zero)
                Name (NPVV, Zero)
                Name (NRPN, Zero)
                Name (MXIE, Zero)
                Name (ISD3, Zero)
                Method (RPON, 0, Serialized)
                {
                    If ((ISD3 == Zero))
                    {
                        Return (Zero)
                    }

                    ISD3 = Zero
                    ADBG (Concatenate ("RPONs: ", ToHexString (NRPN)))
                    PON (PWRG)
                    If ((DerefOf (SCLK [Zero]) != Zero))
                    {
                        PCRA (0xDC, 0x100C, ~DerefOf (SCLK [One]))
                        Sleep (0x10)
                    }

                    PON (RSTG)
                    RDCA (NCRN, 0x0420, 0xBFFFFFFF, Zero, One)
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x08, One)
                    Sleep (0x10)
                    Local0 = Zero
                    While ((RDCA (NCRN, 0xE2, Zero, Zero, Zero) & 0x08))
                    {
                        If ((Local0 > 0x04))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0420, 0xFFFFFFFF, 0x40000000, One)
                    Local0 = Zero
                    While (((RDCA (NCRN, 0x52, Zero, Zero, Zero) & 0x2000) == Zero))
                    {
                        If ((Local0 > 0x08))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFF7, Zero, One)
                    Sleep (0x07D0)
                    NVD0 ()
                    ADBG (Concatenate ("RPONe: ", ToHexString (NRPN)))
                }

                Method (RPOF, 0, Serialized)
                {
                    If ((NVD3 () == Zero))
                    {
                        Return (Zero)
                    }

                    ADBG (Concatenate ("POFF NRPN: ", ToHexString (NRPN)))
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x04, One)
                    Sleep (0x10)
                    Local0 = Zero
                    While ((RDCA (NCRN, 0xE2, Zero, Zero, Zero) & 0x04))
                    {
                        If ((Local0 > 0x04))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFFF, 0x08, One)
                    POFF (RSTG)
                    If ((DerefOf (SCLK [Zero]) != Zero))
                    {
                        PCRO (0xDC, 0x100C, DerefOf (SCLK [One]))
                        Sleep (0x10)
                    }

                    POFF (PWRG)
                    RDCA (NCRN, 0x50, 0xFFFFFFFF, 0x10, One)
                    RDCA (NCRN, 0x50, 0xFFFFFFEF, Zero, One)
                    ISD3 = 0x03
                }

                Method (NVD3, 0, Serialized)
                {
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    PCMD = RDCA (NCRN, 0x04, Zero, Zero, 0x02)
                    If ((NITV == One))
                    {
                        PRBI = 0x24
                        PRBD = RDCA (NCRN, 0x24, Zero, Zero, 0x02)
                    }
                    ElseIf ((NITV == 0x02))
                    {
                        PRBI = 0x10
                        PRBD = RDCA (NCRN, 0x10, Zero, Zero, 0x02)
                        OperationRegion (MCRC, SystemMemory, (GPCB () + 0x000B833C), 0x04)
                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }

                        MXIE = RDCA (NCRN, TCSO, Zero, Zero, 0x02)
                    }

                    RDCA (NCRN, (NPMV + 0x04), 0xFFFFFFFC, 0x03, 0x03)
                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, 0x03, One)
                    Return (One)
                }

                Method (NVD0, 0, Serialized)
                {
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, Zero, One)
                    RDCA (NCRN, (NPMV + 0x04), 0xFFFFFFFC, Zero, 0x03)
                    CNRS ()
                    If ((NITV == 0x02))
                    {
                        OperationRegion (MCRC, SystemMemory, (GPCB () + 0x000B833C), 0x04)
                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }

                        RDCA (NCRN, TCSO, 0xFFFFFFFF, (MXIE & 0x80000000), 0x03)
                        ADBG ("NVD0:  MSIXe")
                    }
                    Else
                    {
                    }

                    Return (One)
                }

                Method (CNRS, 0, Serialized)
                {
                    Debug = "[ACPI RST] Restore Remapped Device and Hidden RP context |start"
                    ADBG (Concatenate ("CNRSs ", ToDecimalString (Timer)))
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    RDCA (NCRN, 0x10, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x14, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x18, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x1C, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x20, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x24, Zero, Zero, 0x03)
                    RDCA (NCRN, PRBI, Zero, PRBD, 0x03)
                    RDCA (NCRN, 0x04, 0xFFFFFFF8, PCMD, 0x03)
                    If ((NL1V != Zero))
                    {
                        RDCA (NCRN, (NL1V + 0x0C), 0xFFFFFF00, ND2V, 0x03)
                        RDCA (NCRN, (NL1V + 0x08), 0x0F, (ND1V & 0xFFFFFFF0), 0x03)
                        RDCA (NCRN, (NL1V + 0x08), 0xFFFFFFFF, ND1V, 0x03)
                    }

                    If ((NLRV != Zero))
                    {
                        RDCA (NCRN, (NLRV + 0x04), 0xFFFFFFFF, NLDV, 0x03)
                    }

                    RDCA (NCRN, (NPCV + 0x10), 0xFFFFFEBF, (NEAV & 0xFFFC), 0x03)
                    RDCA (NCRN, (NPCV + 0x28), 0xFFFFFBFF, NECV, 0x03)
                    RDCA (NCRN, (NPCV + 0x08), 0xFFFFFF1F, NEBV, 0x03)
                    RDCA (NCRN, 0x68, 0xFFFFFBFF, NRAV, One)
                    If (((NEAV & 0x40) == 0x40))
                    {
                        RDCA (NCRN, 0x50, 0xFFFFFFDF, 0x20, One)
                        ADBG (Concatenate ("CNRSw ", ToDecimalString (Timer)))
                        While (((RDCA (NCRN, 0x52, Zero, Zero, Zero) & 0x2000) == Zero))
                        {
                            Stall (0x0A)
                        }
                    }

                    ADBG (Concatenate ("CNRSx ", ToDecimalString (Timer)))
                    RDCA (NCRN, (NPCV + 0x10), 0xFFFFFFFC, (NEAV & 0x03), 0x03)
                    If ((NMVV != Zero))
                    {
                        RDCA (NCRN, NMBV, Zero, NMVV, 0x03)
                    }

                    If ((NPVV != Zero))
                    {
                        RDCA (NCRN, NPBV, Zero, NPVV, 0x03)
                    }

                    ADBG (Concatenate ("CNRSe ", ToDecimalString (Timer)))
                    Debug = "[ACPI RST] Restore Remapped Device and Hidden RP context |complete"
                }
            }

            Device (NVM2)
            {
                Name (_ADR, 0x00C2FFFF)  // _ADR: Address
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    NITV = NIT2 /* \NIT2 */
                    NPMV = NPM2 /* \NPM2 */
                    NPCV = NPC2 /* \NPC2 */
                    NL1V = NL12 /* \NL12 */
                    ND2V = ND22 /* \ND22 */
                    ND1V = ND12 /* \ND12 */
                    NLRV = NLR2 /* \NLR2 */
                    NLDV = NLD2 /* \NLD2 */
                    NEAV = NEA2 /* \NEA2 */
                    NEBV = NEB2 /* \NEB2 */
                    NECV = NEC2 /* \NEC2 */
                    NRAV = NRA2 /* \NRA2 */
                    NMBV = NMB2 /* \NMB2 */
                    NMVV = NMV2 /* \NMV2 */
                    NPBV = NPB2 /* \NPB2 */
                    NPVV = NPV2 /* \NPV2 */
                    NRPN = NRP2 /* \NRP2 */
                    NCRN = One
                    ARPC (NRPN, RefOf (PWRG), RefOf (RSTG), RefOf (SCLK))
                }

                Name (PRBI, Zero)
                Name (PRBD, Zero)
                Name (PCMD, Zero)
                Name (RSTG, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (PWRG, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (SCLK, Package (0x03)
                {
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (NCRN, Zero)
                Name (NITV, Zero)
                Name (NPMV, Zero)
                Name (NPCV, Zero)
                Name (NL1V, Zero)
                Name (ND2V, Zero)
                Name (ND1V, Zero)
                Name (NLRV, Zero)
                Name (NLDV, Zero)
                Name (NEAV, Zero)
                Name (NEBV, Zero)
                Name (NECV, Zero)
                Name (NRAV, Zero)
                Name (NMBV, Zero)
                Name (NMVV, Zero)
                Name (NPBV, Zero)
                Name (NPVV, Zero)
                Name (NRPN, Zero)
                Name (MXIE, Zero)
                Name (ISD3, Zero)
                Method (RPON, 0, Serialized)
                {
                    If ((ISD3 == Zero))
                    {
                        Return (Zero)
                    }

                    ISD3 = Zero
                    ADBG (Concatenate ("RPONs: ", ToHexString (NRPN)))
                    PON (PWRG)
                    If ((DerefOf (SCLK [Zero]) != Zero))
                    {
                        PCRA (0xDC, 0x100C, ~DerefOf (SCLK [One]))
                        Sleep (0x10)
                    }

                    PON (RSTG)
                    RDCA (NCRN, 0x0420, 0xBFFFFFFF, Zero, One)
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x08, One)
                    Sleep (0x10)
                    Local0 = Zero
                    While ((RDCA (NCRN, 0xE2, Zero, Zero, Zero) & 0x08))
                    {
                        If ((Local0 > 0x04))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0420, 0xFFFFFFFF, 0x40000000, One)
                    Local0 = Zero
                    While (((RDCA (NCRN, 0x52, Zero, Zero, Zero) & 0x2000) == Zero))
                    {
                        If ((Local0 > 0x08))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFF7, Zero, One)
                    Sleep (0x07D0)
                    NVD0 ()
                    ADBG (Concatenate ("RPONe: ", ToHexString (NRPN)))
                }

                Method (RPOF, 0, Serialized)
                {
                    If ((NVD3 () == Zero))
                    {
                        Return (Zero)
                    }

                    ADBG (Concatenate ("POFF NRPN: ", ToHexString (NRPN)))
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x04, One)
                    Sleep (0x10)
                    Local0 = Zero
                    While ((RDCA (NCRN, 0xE2, Zero, Zero, Zero) & 0x04))
                    {
                        If ((Local0 > 0x04))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFFF, 0x08, One)
                    POFF (RSTG)
                    If ((DerefOf (SCLK [Zero]) != Zero))
                    {
                        PCRO (0xDC, 0x100C, DerefOf (SCLK [One]))
                        Sleep (0x10)
                    }

                    POFF (PWRG)
                    RDCA (NCRN, 0x50, 0xFFFFFFFF, 0x10, One)
                    RDCA (NCRN, 0x50, 0xFFFFFFEF, Zero, One)
                    ISD3 = 0x03
                }

                Method (NVD3, 0, Serialized)
                {
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    PCMD = RDCA (NCRN, 0x04, Zero, Zero, 0x02)
                    If ((NITV == One))
                    {
                        PRBI = 0x24
                        PRBD = RDCA (NCRN, 0x24, Zero, Zero, 0x02)
                    }
                    ElseIf ((NITV == 0x02))
                    {
                        PRBI = 0x10
                        PRBD = RDCA (NCRN, 0x10, Zero, Zero, 0x02)
                        OperationRegion (MCRC, SystemMemory, (GPCB () + 0x000B833C), 0x04)
                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }

                        MXIE = RDCA (NCRN, TCSO, Zero, Zero, 0x02)
                    }

                    RDCA (NCRN, (NPMV + 0x04), 0xFFFFFFFC, 0x03, 0x03)
                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, 0x03, One)
                    Return (One)
                }

                Method (NVD0, 0, Serialized)
                {
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, Zero, One)
                    RDCA (NCRN, (NPMV + 0x04), 0xFFFFFFFC, Zero, 0x03)
                    CNRS ()
                    If ((NITV == 0x02))
                    {
                        OperationRegion (MCRC, SystemMemory, (GPCB () + 0x000B833C), 0x04)
                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }

                        RDCA (NCRN, TCSO, 0xFFFFFFFF, (MXIE & 0x80000000), 0x03)
                        ADBG ("NVD0:  MSIXe")
                    }
                    Else
                    {
                    }

                    Return (One)
                }

                Method (CNRS, 0, Serialized)
                {
                    Debug = "[ACPI RST] Restore Remapped Device and Hidden RP context |start"
                    ADBG (Concatenate ("CNRSs ", ToDecimalString (Timer)))
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    RDCA (NCRN, 0x10, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x14, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x18, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x1C, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x20, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x24, Zero, Zero, 0x03)
                    RDCA (NCRN, PRBI, Zero, PRBD, 0x03)
                    RDCA (NCRN, 0x04, 0xFFFFFFF8, PCMD, 0x03)
                    If ((NL1V != Zero))
                    {
                        RDCA (NCRN, (NL1V + 0x0C), 0xFFFFFF00, ND2V, 0x03)
                        RDCA (NCRN, (NL1V + 0x08), 0x0F, (ND1V & 0xFFFFFFF0), 0x03)
                        RDCA (NCRN, (NL1V + 0x08), 0xFFFFFFFF, ND1V, 0x03)
                    }

                    If ((NLRV != Zero))
                    {
                        RDCA (NCRN, (NLRV + 0x04), 0xFFFFFFFF, NLDV, 0x03)
                    }

                    RDCA (NCRN, (NPCV + 0x10), 0xFFFFFEBF, (NEAV & 0xFFFC), 0x03)
                    RDCA (NCRN, (NPCV + 0x28), 0xFFFFFBFF, NECV, 0x03)
                    RDCA (NCRN, (NPCV + 0x08), 0xFFFFFF1F, NEBV, 0x03)
                    RDCA (NCRN, 0x68, 0xFFFFFBFF, NRAV, One)
                    If (((NEAV & 0x40) == 0x40))
                    {
                        RDCA (NCRN, 0x50, 0xFFFFFFDF, 0x20, One)
                        ADBG (Concatenate ("CNRSw ", ToDecimalString (Timer)))
                        While (((RDCA (NCRN, 0x52, Zero, Zero, Zero) & 0x2000) == Zero))
                        {
                            Stall (0x0A)
                        }
                    }

                    ADBG (Concatenate ("CNRSx ", ToDecimalString (Timer)))
                    RDCA (NCRN, (NPCV + 0x10), 0xFFFFFFFC, (NEAV & 0x03), 0x03)
                    If ((NMVV != Zero))
                    {
                        RDCA (NCRN, NMBV, Zero, NMVV, 0x03)
                    }

                    If ((NPVV != Zero))
                    {
                        RDCA (NCRN, NPBV, Zero, NPVV, 0x03)
                    }

                    ADBG (Concatenate ("CNRSe ", ToDecimalString (Timer)))
                    Debug = "[ACPI RST] Restore Remapped Device and Hidden RP context |complete"
                }
            }

            Device (NVM3)
            {
                Name (_ADR, 0x00C3FFFF)  // _ADR: Address
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    NITV = NIT3 /* \NIT3 */
                    NPMV = NPM3 /* \NPM3 */
                    NPCV = NPC3 /* \NPC3 */
                    NL1V = NL13 /* \NL13 */
                    ND2V = ND23 /* \ND23 */
                    ND1V = ND13 /* \ND13 */
                    NLRV = NLR3 /* \NLR3 */
                    NLDV = NLD3 /* \NLD3 */
                    NEAV = NEA3 /* \NEA3 */
                    NEBV = NEB3 /* \NEB3 */
                    NECV = NEC3 /* \NEC3 */
                    NRAV = NRA3 /* \NRA3 */
                    NMBV = NMB3 /* \NMB3 */
                    NMVV = NMV3 /* \NMV3 */
                    NPBV = NPB3 /* \NPB3 */
                    NPVV = NPV3 /* \NPV3 */
                    NRPN = NRP3 /* \NRP3 */
                    NCRN = 0x02
                    ARPC (NRPN, RefOf (PWRG), RefOf (RSTG), RefOf (SCLK))
                }

                Name (PRBI, Zero)
                Name (PRBD, Zero)
                Name (PCMD, Zero)
                Name (RSTG, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (PWRG, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (SCLK, Package (0x03)
                {
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (NCRN, Zero)
                Name (NITV, Zero)
                Name (NPMV, Zero)
                Name (NPCV, Zero)
                Name (NL1V, Zero)
                Name (ND2V, Zero)
                Name (ND1V, Zero)
                Name (NLRV, Zero)
                Name (NLDV, Zero)
                Name (NEAV, Zero)
                Name (NEBV, Zero)
                Name (NECV, Zero)
                Name (NRAV, Zero)
                Name (NMBV, Zero)
                Name (NMVV, Zero)
                Name (NPBV, Zero)
                Name (NPVV, Zero)
                Name (NRPN, Zero)
                Name (MXIE, Zero)
                Name (ISD3, Zero)
                Method (RPON, 0, Serialized)
                {
                    If ((ISD3 == Zero))
                    {
                        Return (Zero)
                    }

                    ISD3 = Zero
                    ADBG (Concatenate ("RPONs: ", ToHexString (NRPN)))
                    PON (PWRG)
                    If ((DerefOf (SCLK [Zero]) != Zero))
                    {
                        PCRA (0xDC, 0x100C, ~DerefOf (SCLK [One]))
                        Sleep (0x10)
                    }

                    PON (RSTG)
                    RDCA (NCRN, 0x0420, 0xBFFFFFFF, Zero, One)
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x08, One)
                    Sleep (0x10)
                    Local0 = Zero
                    While ((RDCA (NCRN, 0xE2, Zero, Zero, Zero) & 0x08))
                    {
                        If ((Local0 > 0x04))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0420, 0xFFFFFFFF, 0x40000000, One)
                    Local0 = Zero
                    While (((RDCA (NCRN, 0x52, Zero, Zero, Zero) & 0x2000) == Zero))
                    {
                        If ((Local0 > 0x08))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFF7, Zero, One)
                    Sleep (0x07D0)
                    NVD0 ()
                    ADBG (Concatenate ("RPONe: ", ToHexString (NRPN)))
                }

                Method (RPOF, 0, Serialized)
                {
                    If ((NVD3 () == Zero))
                    {
                        Return (Zero)
                    }

                    ADBG (Concatenate ("POFF NRPN: ", ToHexString (NRPN)))
                    RDCA (NCRN, 0xE2, 0xFFFFFFFF, 0x04, One)
                    Sleep (0x10)
                    Local0 = Zero
                    While ((RDCA (NCRN, 0xE2, Zero, Zero, Zero) & 0x04))
                    {
                        If ((Local0 > 0x04))
                        {
                            Break
                        }

                        Sleep (0x10)
                        Local0++
                    }

                    RDCA (NCRN, 0x0324, 0xFFFFFFFF, 0x08, One)
                    POFF (RSTG)
                    If ((DerefOf (SCLK [Zero]) != Zero))
                    {
                        PCRO (0xDC, 0x100C, DerefOf (SCLK [One]))
                        Sleep (0x10)
                    }

                    POFF (PWRG)
                    RDCA (NCRN, 0x50, 0xFFFFFFFF, 0x10, One)
                    RDCA (NCRN, 0x50, 0xFFFFFFEF, Zero, One)
                    ISD3 = 0x03
                }

                Method (NVD3, 0, Serialized)
                {
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    PCMD = RDCA (NCRN, 0x04, Zero, Zero, 0x02)
                    If ((NITV == One))
                    {
                        PRBI = 0x24
                        PRBD = RDCA (NCRN, 0x24, Zero, Zero, 0x02)
                    }
                    ElseIf ((NITV == 0x02))
                    {
                        PRBI = 0x10
                        PRBD = RDCA (NCRN, 0x10, Zero, Zero, 0x02)
                        OperationRegion (MCRC, SystemMemory, (GPCB () + 0x000B833C), 0x04)
                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }

                        MXIE = RDCA (NCRN, TCSO, Zero, Zero, 0x02)
                    }

                    RDCA (NCRN, (NPMV + 0x04), 0xFFFFFFFC, 0x03, 0x03)
                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, 0x03, One)
                    Return (One)
                }

                Method (NVD0, 0, Serialized)
                {
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    RDCA (NCRN, 0xA4, 0xFFFFFFFC, Zero, One)
                    RDCA (NCRN, (NPMV + 0x04), 0xFFFFFFFC, Zero, 0x03)
                    CNRS ()
                    If ((NITV == 0x02))
                    {
                        OperationRegion (MCRC, SystemMemory, (GPCB () + 0x000B833C), 0x04)
                        Field (MCRC, AnyAcc, NoLock, Preserve)
                        {
                            SCSO,   8, 
                            Offset (0x02), 
                            TCSO,   8, 
                                ,   7, 
                            RE,     1
                        }

                        RDCA (NCRN, TCSO, 0xFFFFFFFF, (MXIE & 0x80000000), 0x03)
                        ADBG ("NVD0:  MSIXe")
                    }
                    Else
                    {
                    }

                    Return (One)
                }

                Method (CNRS, 0, Serialized)
                {
                    Debug = "[ACPI RST] Restore Remapped Device and Hidden RP context |start"
                    ADBG (Concatenate ("CNRSs ", ToDecimalString (Timer)))
                    If ((NITV == Zero))
                    {
                        Return (Zero)
                    }

                    RDCA (NCRN, 0x10, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x14, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x18, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x1C, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x20, Zero, Zero, 0x03)
                    RDCA (NCRN, 0x24, Zero, Zero, 0x03)
                    RDCA (NCRN, PRBI, Zero, PRBD, 0x03)
                    RDCA (NCRN, 0x04, 0xFFFFFFF8, PCMD, 0x03)
                    If ((NL1V != Zero))
                    {
                        RDCA (NCRN, (NL1V + 0x0C), 0xFFFFFF00, ND2V, 0x03)
                        RDCA (NCRN, (NL1V + 0x08), 0x0F, (ND1V & 0xFFFFFFF0), 0x03)
                        RDCA (NCRN, (NL1V + 0x08), 0xFFFFFFFF, ND1V, 0x03)
                    }

                    If ((NLRV != Zero))
                    {
                        RDCA (NCRN, (NLRV + 0x04), 0xFFFFFFFF, NLDV, 0x03)
                    }

                    RDCA (NCRN, (NPCV + 0x10), 0xFFFFFEBF, (NEAV & 0xFFFC), 0x03)
                    RDCA (NCRN, (NPCV + 0x28), 0xFFFFFBFF, NECV, 0x03)
                    RDCA (NCRN, (NPCV + 0x08), 0xFFFFFF1F, NEBV, 0x03)
                    RDCA (NCRN, 0x68, 0xFFFFFBFF, NRAV, One)
                    If (((NEAV & 0x40) == 0x40))
                    {
                        RDCA (NCRN, 0x50, 0xFFFFFFDF, 0x20, One)
                        ADBG (Concatenate ("CNRSw ", ToDecimalString (Timer)))
                        While (((RDCA (NCRN, 0x52, Zero, Zero, Zero) & 0x2000) == Zero))
                        {
                            Stall (0x0A)
                        }
                    }

                    ADBG (Concatenate ("CNRSx ", ToDecimalString (Timer)))
                    RDCA (NCRN, (NPCV + 0x10), 0xFFFFFFFC, (NEAV & 0x03), 0x03)
                    If ((NMVV != Zero))
                    {
                        RDCA (NCRN, NMBV, Zero, NMVV, 0x03)
                    }

                    If ((NPVV != Zero))
                    {
                        RDCA (NCRN, NPBV, Zero, NPVV, 0x03)
                    }

                    ADBG (Concatenate ("CNRSe ", ToDecimalString (Timer)))
                    Debug = "[ACPI RST] Restore Remapped Device and Hidden RP context |complete"
                }
            }

            Method (PSTA, 1, Serialized)
            {
                If ((DerefOf (Arg0 [Zero]) == Zero))
                {
                    Return (One)
                }

                If ((DerefOf (Arg0 [Zero]) == One))
                {
                    If ((GGOV (DerefOf (Arg0 [0x02])) == DerefOf (Arg0 [0x03]
                        )))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                If ((DerefOf (Arg0 [Zero]) == 0x02))
                {
                    If ((^^GEXP.GEPS (DerefOf (Arg0 [One]), DerefOf (Arg0 [0x02]
                        )) == DerefOf (Arg0 [0x03])))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Return (Zero)
            }

            Method (PON, 1, Serialized)
            {
                If ((DerefOf (Arg0 [Zero]) != Zero))
                {
                    If ((DerefOf (Arg0 [Zero]) == One))
                    {
                        ADBG (Concatenate ("PON GPIO=", ToHexString (DerefOf (Arg0 [0x02]))))
                        SGOV (DerefOf (Arg0 [0x02]), DerefOf (Arg0 [0x03]))
                    }

                    If ((DerefOf (Arg0 [Zero]) == 0x02))
                    {
                        ADBG (Concatenate ("PON IOEX=", ToHexString (DerefOf (Arg0 [0x02]))))
                        ^^GEXP.SGEP (DerefOf (Arg0 [One]), DerefOf (Arg0 [0x02]), DerefOf (
                            Arg0 [0x03]))
                    }
                }
            }

            Method (POFF, 1, Serialized)
            {
                If ((DerefOf (Arg0 [Zero]) != Zero))
                {
                    If ((DerefOf (Arg0 [Zero]) == One))
                    {
                        ADBG (Concatenate ("POFF GPIO=", ToHexString (DerefOf (Arg0 [0x02]))))
                        SGOV (DerefOf (Arg0 [0x02]), (DerefOf (Arg0 [0x03]) ^ 
                            One))
                    }

                    If ((DerefOf (Arg0 [Zero]) == 0x02))
                    {
                        ADBG (Concatenate ("POFF IOEX=", ToHexString (DerefOf (Arg0 [0x02]))))
                        ^^GEXP.SGEP (DerefOf (Arg0 [One]), DerefOf (Arg0 [0x02]), (
                            DerefOf (Arg0 [0x03]) ^ One))
                    }
                }
            }
        }

        Device (CIO2)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((CIOE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (_HID, "INT343E")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (CBUF, Buffer (0x17)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x0D, 0x01, 0x10, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x40,  // .......@
                    /* 0010 */  0xFE, 0x00, 0x00, 0x01, 0x00, 0x79, 0x00         // .....y.
                })
                CreateDWordField (CBUF, 0x05, CIOV)
                CIOV = CIOI /* \CIOI */
                Return (CBUF) /* \_SB_.PCI0.CIO2._CRS.CBUF */
            }
        }

        Device (TERM)
        {
            Name (_HID, "INT343D")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0xC0, 0x03, 0xFE,  // ........
                    /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x89, 0x06, 0x00, 0x0D,  // ........
                    /* 0010 */  0x01, 0x12, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                CreateDWordField (RBUF, 0x11, IRQN)
                IRQN = TIRQ /* \TIRQ */
                Return (RBUF) /* \_SB_.PCI0.TERM._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TAEN == Zero))
                {
                    Return (Zero)
                }

                If ((TIRQ == Zero))
                {
                    Return (Zero)
                }

                Return (0x0F)
            }
        }
    }

    Scope (_SB)
    {
        Name (HDAA, Zero)
        Name (DISA, One)
        Method (DION, 0, NotSerialized)
        {
            VMMH (One, One)
        }

        Method (DIOF, 0, NotSerialized)
        {
            VMMH (One, Zero)
        }

        Method (VMMH, 2, Serialized)
        {
        }
    }

    Scope (_SB.PCI0)
    {
        Method (LPD3, 1, Serialized)
        {
            OperationRegion (ICB1, SystemMemory, (Arg0 + 0x84), 0x04)
            Field (ICB1, DWordAcc, NoLock, Preserve)
            {
                PMEC,   32
            }

            PMEC = 0x03
            TEMP = PMEC /* \_SB_.PCI0.LPD3.PMEC */
        }

        Method (LPD0, 1, Serialized)
        {
            OperationRegion (ICB1, SystemMemory, (Arg0 + 0x84), 0x04)
            Field (ICB1, DWordAcc, NoLock, Preserve)
            {
                PMEC,   32
            }

            PMEC &= 0xFFFF7FFC
            TEMP = PMEC /* \_SB_.PCI0.LPD0.PMEC */
        }

        Method (LHRV, 1, Serialized)
        {
            OperationRegion (ICB1, SystemMemory, (Arg0 + 0x08), 0x04)
            Field (ICB1, DWordAcc, NoLock, Preserve)
            {
                HRV,    8
            }

            Return (HRV) /* \_SB_.PCI0.LHRV.HRV_ */
        }

        Method (GETD, 1, Serialized)
        {
            OperationRegion (ICB1, SystemMemory, (Arg0 + 0x84), 0x04)
            Field (ICB1, DWordAcc, NoLock, Preserve)
            {
                PMEC,   32
            }

            Return ((PMEC & 0x03))
        }

        Method (LCRS, 3, Serialized)
        {
            Name (RBUF, Buffer (0x17)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x89, 0x06, 0x00, 0x0D,  // ........
                /* 0010 */  0x01, 0x14, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
            })
            CreateDWordField (RBUF, 0x04, BVAL)
            CreateDWordField (RBUF, 0x08, BLEN)
            CreateDWordField (RBUF, 0x11, IRQN)
            BVAL = Arg1
            IRQN = Arg2
            If ((Arg0 == 0x04))
            {
                BLEN = 0x08
            }

            Return (RBUF) /* \_SB_.PCI0.LCRS.RBUF */
        }

        Method (LSTA, 1, Serialized)
        {
            If (((Arg0 == Zero) || (Arg0 == 0x03)))
            {
                Return (Zero)
            }

            If ((OSYS < 0x07DC))
            {
                Return (Zero)
            }

            Return (0x0F)
        }

        Method (GIRQ, 1, Serialized)
        {
            Return ((0x18 + (Arg0 % 0x60)))
        }
    }

    Scope (_SB.PCI0)
    {
        Device (SIRC)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_STA, 0x03)  // _STA: Status
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (ADDB, 3, Serialized)
            {
                Name (BUFF, Buffer (0x0E)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
                })
                CreateDWordField (BUFF, 0x04, ADDR)
                CreateDWordField (BUFF, 0x08, LENG)
                Local0 = Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    }
                If ((((Arg0 == One) || (Arg0 == 0x03)) || (Arg0 == 0x04)))
                {
                    ADDR = Arg2
                    ConcatenateResTemplate (Local0, BUFF, Local1)
                    Local0 = Local1
                }

                If ((Arg0 == 0x03))
                {
                    ADDR = Arg1
                    ConcatenateResTemplate (Local0, BUFF, Local1)
                    Local0 = Local1
                }

                If ((Arg0 == 0x04))
                {
                    ADDR = (0x08 + Arg1)
                    LENG = 0x0FF8
                    ConcatenateResTemplate (Local0, BUFF, Local1)
                    Local0 = Local1
                }

                Return (Local0)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Local0 = Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    }
                ConcatenateResTemplate (Local0, ADDB (SMD0, SB00, SB10), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD1, SB01, SB11), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD2, SB02, SB12), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD3, SB03, SB13), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD4, SB04, SB14), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD5, SB05, SB15), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD6, SB06, SB16), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD7, SB07, SB17), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD8, SB08, SB18), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMD9, SB09, SB19), Local1)
                Local0 = Local1
                ConcatenateResTemplate (Local0, ADDB (SMDA, SB0A, SB1A), Local1)
                Local0 = Local1
                If ((^^GPI0._STA () == Zero))
                {
                    ConcatenateResTemplate (Local0, ^^GPI0._CRS (), Local1)
                    Local0 = Local1
                }

                Return (Local0)
            }
        }

        Device (GPI0)
        {
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                If ((PCHV () == SPTH))
                {
                    If ((PCHG == 0x02))
                    {
                        Return ("INT3451")
                    }

                    Return ("INT345D")
                }

                Return ("INT344B")
            }

            Name (LINK, "\\_SB.PCI0.GPI0")
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x2F)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x01, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x01, 0x00, 0x89, 0x06, 0x00, 0x0D,  // ........
                    /* 0028 */  0x01, 0x0E, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                CreateDWordField (RBUF, 0x04, COM0)
                CreateDWordField (RBUF, 0x10, COM1)
                CreateDWordField (RBUF, 0x29, IRQN)
                COM0 = (SBRG + 0x00AF0000)
                COM1 = (SBRG + 0x00AE0000)
                CreateDWordField (RBUF, 0x1C, COM3)
                COM3 = (SBRG + 0x00AC0000)
                IRQN = SGIR /* \SGIR */
                Return (RBUF) /* \_SB_.PCI0.GPI0._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((SBRG == Zero))
                {
                    Return (Zero)
                }

                If ((GPEN == Zero))
                {
                    Return (Zero)
                }

                Return (0x0F)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (I2C0)
        {
            Name (LINK, "\\_SB.PCI0.I2C0")
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB10))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB10)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB10)
            }

            If ((SMD0 != 0x02))
            {
                Name (_HID, "INT3442")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB10))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD0, SB00, SIR0))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD0))
                }
            }

            If ((SMD0 == 0x02))
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (I2C1)
        {
            Name (LINK, "\\_SB.PCI0.I2C1")
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB11))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB11)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB11)
            }

            If ((SMD1 != 0x02))
            {
                Name (_HID, "INT3443")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB11))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD1, SB01, SIR1))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD1))
                }
            }

            If ((SMD1 == 0x02))
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (I2C2)
        {
            Name (LINK, "\\_SB.PCI0.I2C2")
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB12))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB12)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB12)
            }

            If ((SMD2 != 0x02))
            {
                Name (_HID, "INT3444")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB12))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD2, SB02, SIR2))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD2))
                }
            }

            If ((SMD2 == 0x02))
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (I2C3)
        {
            Name (LINK, "\\_SB.PCI0.I2C3")
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB13))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB13)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB13)
            }

            If ((SMD3 != 0x02))
            {
                Name (_HID, "INT3445")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB13))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD3, SB03, SIR3))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD3))
                }
            }

            If ((SMD3 == 0x02))
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (I2C4)
        {
            Name (LINK, "\\_SB.PCI0.I2C4")
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB14))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB14)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB14)
            }

            If ((SMD4 != 0x02))
            {
                Name (_HID, "INT3446")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB14))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD4, SB04, SIR4))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD4))
                }
            }

            If ((SMD4 == 0x02))
            {
                Name (_ADR, 0x00190002)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (I2C5)
        {
            Name (LINK, "\\_SB.PCI0.I2C5")
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB15))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB15)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB15)
            }

            If ((SMD5 != 0x02))
            {
                Name (_HID, "INT3447")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB15))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD5, SB05, SIR5))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD5))
                }
            }

            If ((SMD5 == 0x02))
            {
                Name (_ADR, 0x00190001)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (SPI0)
        {
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB16))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB16)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB16)
            }

            If ((SMD6 != 0x02))
            {
                Name (_HID, "INT3440")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB16))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD6, SB06, SIR6))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD6))
                }
            }

            If ((SMD6 == 0x02))
            {
                Name (_ADR, 0x001E0002)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (SPI1)
        {
            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (GETD (SB17))
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                LPD0 (SB17)
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                LPD3 (SB17)
            }

            If ((SMD7 != 0x02))
            {
                Name (_HID, "INT3441")  // _HID: Hardware ID
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB17))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD7, SB07, SIR7))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD7))
                }
            }

            If ((SMD7 == 0x02))
            {
                Name (_ADR, 0x001E0003)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UA00)
        {
            If ((SMD8 != 0x02))
            {
                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {
                    If ((SMD8 == 0x04))
                    {
                        Return (0x020CD041)
                    }
                    Else
                    {
                        Return ("INT3448")
                    }
                }

                Name (_UID, "SerialIoUart0")  // _UID: Unique ID
                Name (_DDN, "SerialIoUart0")  // _DDN: DOS Device Name
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB18))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD8, SB08, SIR8))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD8))
                }
            }

            If ((SMD8 == 0x02))
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            If ((SMD8 != 0x04))
            {
                Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                {
                    Return (GETD (SB18))
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    LPD0 (SB18)
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    LPD3 (SB18)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UA01)
        {
            If ((SMD9 != 0x02))
            {
                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {
                    If ((SMD9 == 0x04))
                    {
                        Return (0x020CD041)
                    }
                    Else
                    {
                        Return ("INT3449")
                    }
                }

                Name (_UID, "SerialIoUart1")  // _UID: Unique ID
                Name (_DDN, "SerialIoUart1")  // _DDN: DOS Device Name
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB19))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMD9, SB09, SIR9))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMD9))
                }
            }

            If ((SMD9 == 0x02))
            {
                Name (_ADR, 0x001E0001)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            If ((SMD9 != 0x04))
            {
                Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                {
                    Return (GETD (SB19))
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    LPD0 (SB19)
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    LPD3 (SB19)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UA02)
        {
            If ((SMDA != 0x02))
            {
                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {
                    If ((SMDA == 0x04))
                    {
                        Return (0x020CD041)
                    }
                    Else
                    {
                        Return ("INT344A")
                    }
                }

                Name (_UID, "SerialIoUart2")  // _UID: Unique ID
                Name (_DDN, "SerialIoUart2")  // _DDN: DOS Device Name
                Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
                {
                    Return (LHRV (SB1A))
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Return (LCRS (SMDA, SB0A, SIRA))
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (LSTA (SMDA))
                }
            }

            If ((SMDA == 0x02))
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }

            If ((SMDA != 0x04))
            {
                Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                {
                    Return (GETD (SB1A))
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    LPD0 (SB1A)
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    LPD3 (SB1A)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (GEXP)
        {
            Name (_ADR, One)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
            OperationRegion (BAR0, SystemMemory, SB04, 0x0208)
            Field (BAR0, DWordAcc, NoLock, Preserve)
            {
                ICON,   32, 
                TAR,    32, 
                Offset (0x10), 
                DATA,   32, 
                HCNT,   32, 
                LCNT,   32, 
                Offset (0x2C), 
                    ,   5, 
                ABRT,   1, 
                Offset (0x40), 
                RBCK,   32, 
                Offset (0x54), 
                CLR,    32, 
                Offset (0x6C), 
                ENB,    1, 
                Offset (0x70), 
                ACTV,   1, 
                TFNF,   1, 
                    ,   1, 
                RFNE,   1, 
                Offset (0x7C), 
                HOLD,   32, 
                Offset (0x9C), 
                ENSB,   1, 
                Offset (0x204), 
                RST,    32
            }

            Method (SGEP, 3, Serialized)
            {
                CSER (GEXN, Arg0, Arg1, Arg2, Zero)
            }

            Method (SGED, 3, Serialized)
            {
                CSER (GEXN, Arg0, Arg1, Arg2, One)
            }

            Method (GEPS, 2, Serialized)
            {
                Return (CSER (GEXN, Arg0, Arg1, Zero, 0x02))
            }

            Method (SGEI, 3, Serialized)
            {
                CSER (GEXN, Arg0, Arg1, Arg2, 0x03)
            }

            Method (INVC, 0, NotSerialized)
            {
                Local0 = Zero
                While ((Local0 < 0x10))
                {
                    If ((R3DC (Zero, Local0, Zero) == 0x02))
                    {
                        W3DC (Zero, Local0, Zero, One)
                    }

                    If ((R3DC (One, Local0, Zero) == 0x02))
                    {
                        W3DC (One, Local0, Zero, One)
                    }

                    Local0 += One
                }
            }

            Name (PPR, 0x08)
            Name (INR, Package (0x03)
            {
                Zero, 
                One, 
                0x02
            })
            Name (OUTR, Package (0x03)
            {
                0x04, 
                0x05, 
                0x06
            })
            Name (CFGR, Package (0x03)
            {
                0x0C, 
                0x0D, 
                0x0E
            })
            Name (POLR, Package (0x03)
            {
                0x08, 
                0x09, 
                0x0A
            })
            Name (EXPA, 0x22)
            Name (UCCH, One)
            Name (END, 0x0200)
            Name (READ, 0x0100)
            Name (TEMP, Zero)
            Name (CACH, Package (0x02)
            {
                Package (0x10)
                {
                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }
                }, 

                Package (0x10)
                {
                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        One, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        Zero
                    }
                }
            })
            Method (W3DC, 4, NotSerialized)
            {
                DerefOf (DerefOf (CACH [Arg0]) [Arg1]) [Arg2]
                     = Arg3
            }

            Method (R3DC, 3, NotSerialized)
            {
                Return (DerefOf (DerefOf (DerefOf (CACH [Arg0]) [Arg1]) [
                    Arg2]))
            }

            Method (WREG, 4, Serialized)
            {
                Local1 = (Timer + 0xC350)
                RST = 0x07
                ENB = Zero
                TEMP = RBCK /* \_SB_.PCI0.GEXP.RBCK */
                TEMP = CLR /* \_SB_.PCI0.GEXP.CLR_ */
                HOLD = 0x001C001C
                HCNT = 0x0210
                LCNT = 0x0280
                TAR = (EXPA + Arg1)
                ICON = 0x65
                ENB = One
                While ((ENSB != One))
                {
                    If ((Timer > Local1))
                    {
                        Return (Zero)
                    }
                }

                DATA = Arg2
                DATA = (END + Arg3)
                While ((ACTV != Zero))
                {
                    If ((Timer > Local1))
                    {
                        Return (Zero)
                    }
                }

                ENB = Zero
                While ((ENSB != Zero))
                {
                    If ((Timer > Local1))
                    {
                        Return (Zero)
                    }
                }

                W3DC (Arg1, Arg2, One, Arg3)
                If ((R3DC (Arg1, Arg2, Zero) == One))
                {
                    W3DC (Arg1, Arg2, Zero, 0x02)
                }

                Return (Zero)
            }

            Method (RREG, 3, Serialized)
            {
                If ((UCCH == One))
                {
                    If ((R3DC (Arg1, Arg2, Zero) == 0x02))
                    {
                        Return (R3DC (Arg1, Arg2, One))
                    }
                }

                Local1 = (Timer + 0xC350)
                RST = 0x07
                ENB = Zero
                TEMP = RBCK /* \_SB_.PCI0.GEXP.RBCK */
                TEMP = CLR /* \_SB_.PCI0.GEXP.CLR_ */
                HOLD = 0x001C001C
                HCNT = 0x0210
                LCNT = 0x0280
                TAR = (EXPA + Arg1)
                ICON = 0x65
                ENB = One
                While ((ENSB != One))
                {
                    If ((Timer > Local1))
                    {
                        Return (Zero)
                    }
                }

                DATA = Arg2
                DATA = (END + READ)
                While ((ACTV != Zero))
                {
                    If ((Timer > Local1))
                    {
                        Return (Zero)
                    }
                }

                Local0 = DATA /* \_SB_.PCI0.GEXP.DATA */
                ENB = Zero
                While ((ENSB != Zero))
                {
                    If ((Timer > Local1))
                    {
                        Return (Zero)
                    }
                }

                Return (Local0)
            }

            Method (PS0, 1, Serialized)
            {
                OperationRegion (BAR1, SystemMemory, Arg0, 0x88)
                Field (BAR1, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x84), 
                    D0D3,   2
                }

                D0D3 = Zero
                TEMP = D0D3 /* \_SB_.PCI0.GEXP.PS0_.D0D3 */
            }

            Method (PS3, 1, Serialized)
            {
                OperationRegion (BAR1, SystemMemory, Arg0, 0x88)
                Field (BAR1, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x84), 
                    D0D3,   2
                }

                D0D3 = 0x03
                TEMP = D0D3 /* \_SB_.PCI0.GEXP.PS3_.D0D3 */
            }

            Method (CSER, 5, Serialized)
            {
                Name (SB1X, Zero)
                Name (SB0X, Zero)
                Name (SMDX, Zero)
                Name (PINN, Zero)
                Name (REGN, Zero)
                Name (REGA, Zero)
                Name (OLDV, Zero)
                Name (NEWV, Zero)
                Name (RETV, Zero)
                If ((Arg0 > 0x05))
                {
                    Return (Zero)
                }

                If ((Arg0 == Zero))
                {
                    SB1X = SB10 /* \SB10 */
                    SB0X = SB00 /* \SB00 */
                    SMDX = SMD0 /* \SMD0 */
                }

                If ((Arg0 == One))
                {
                    SB1X = SB11 /* \SB11 */
                    SB0X = SB01 /* \SB01 */
                    SMDX = SMD1 /* \SMD1 */
                }

                If ((Arg0 == 0x02))
                {
                    SB1X = SB12 /* \SB12 */
                    SB0X = SB02 /* \SB02 */
                    SMDX = SMD2 /* \SMD2 */
                }

                If ((Arg0 == 0x03))
                {
                    SB1X = SB13 /* \SB13 */
                    SB0X = SB03 /* \SB03 */
                    SMDX = SMD3 /* \SMD3 */
                }

                If ((Arg0 == 0x04))
                {
                    SB1X = SB14 /* \SB14 */
                    SB0X = SB04 /* \SB04 */
                    SMDX = SMD4 /* \SMD4 */
                }

                If ((Arg0 == 0x05))
                {
                    SB1X = SB15 /* \SB15 */
                    SB0X = SB05 /* \SB05 */
                    SMDX = SMD5 /* \SMD5 */
                }

                If ((Arg0 > 0x05))
                {
                    Return (Zero)
                }

                If ((Arg1 > One))
                {
                    Return (Zero)
                }

                If ((Arg2 > 0x17))
                {
                    Return (Zero)
                }

                If ((Arg3 > One))
                {
                    Return (Zero)
                }

                If ((Arg4 > 0x02))
                {
                    Return (Zero)
                }

                If ((SMDX != 0x03))
                {
                    Return (Zero)
                }

                If ((Arg4 == Zero))
                {
                    Local0 = OUTR /* \_SB_.PCI0.GEXP.OUTR */
                }

                If ((Arg4 == One))
                {
                    Local0 = CFGR /* \_SB_.PCI0.GEXP.CFGR */
                }

                If ((Arg4 == 0x02))
                {
                    Local0 = INR /* \_SB_.PCI0.GEXP.INR_ */
                }

                If ((Arg4 == 0x03))
                {
                    Local0 = POLR /* \_SB_.PCI0.GEXP.POLR */
                }

                PS0 (SB1X)
                Divide (Arg2, PPR, PINN, REGN) /* \_SB_.PCI0.GEXP.CSER.REGN */
                REGA = DerefOf (Local0 [REGN])
                OLDV = RREG (SB0X, Arg1, REGA)
                If ((Arg4 == 0x02))
                {
                    RETV = (One & (OLDV >> PINN))
                }
                Else
                {
                    NEWV = (OLDV & ~(One << PINN))
                    NEWV |= (Arg3 << PINN) /* \_SB_.PCI0.GEXP.CSER.NEWV */
                    If ((NEWV != OLDV))
                    {
                        WREG (SB0X, Arg1, REGA, NEWV)
                    }
                }

                PS3 (SB1X)
                Return (RETV) /* \_SB_.PCI0.GEXP.CSER.RETV */
            }
        }
    }

    If ((PCHV () == SPTL))
    {
        Scope (_SB.PCI0)
        {
            Device (PEMC)
            {
                Name (_ADR, 0x001E0004)  // _ADR: Address
                OperationRegion (SCSR, PCI_Config, Zero, 0x0100)
                Field (SCSR, WordAcc, NoLock, Preserve)
                {
                    Offset (0x84), 
                    PSTA,   32, 
                    Offset (0xA2), 
                        ,   2, 
                    PGEN,   1
                }

                Method (_PS0, 0, Serialized)  // _PS0: Power State 0
                {
                    PGEN = Zero
                    PCRA (0xC0, 0x0600, 0x7FFFFFBA)
                    Sleep (0x02)
                    PCRO (0xC0, 0x0600, 0x80000045)
                    PSTA &= 0xFFFFFFFC
                    TEMP = PSTA /* \_SB_.PCI0.PEMC.PSTA */
                }

                Method (_PS3, 0, Serialized)  // _PS3: Power State 3
                {
                    PGEN = One
                    PSTA |= 0x03
                    TEMP = PSTA /* \_SB_.PCI0.PEMC.PSTA */
                }

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    ADBG (Concatenate ("EMH4=", ToDecimalString (EMH4)))
                    If ((Arg0 == ToUUID ("f6c13ea5-65cd-461f-ab7a-29f7e8d5bd61") /* Unknown UUID */))
                    {
                        If ((Arg1 >= Zero))
                        {
                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    If ((EMH4 == One))
                                    {
                                        Return (Buffer (0x02)
                                        {
                                             0x61, 0x02                                       // a.
                                        })
                                    }

                                    Return (Buffer (0x02)
                                    {
                                         0x21, 0x02                                       // !.
                                    })
                                }
                                Case (0x05)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }
                                Case (0x06)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x05                                             // .
                                    })
                                }
                                Case (0x09)
                                {
                                    Switch (EMDS)
                                    {
                                        Case (Zero)
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x00                                             // .
                                            })
                                        }
                                        Case (One)
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x01                                             // .
                                            })
                                        }
                                        Case (0x04)
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x04                                             // .
                                            })
                                        }

                                    }
                                }

                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Device (CARD)
                {
                    Name (_ADR, 0x08)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }
            }

            Device (PSDC)
            {
                Name (_ADR, 0x001E0006)  // _ADR: Address
                Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
                OperationRegion (SCSR, PCI_Config, Zero, 0x0100)
                Field (SCSR, WordAcc, NoLock, Preserve)
                {
                    Offset (0x84), 
                    PSTA,   32, 
                    Offset (0xA2), 
                        ,   2, 
                    PGEN,   1
                }

                Method (_PS0, 0, Serialized)  // _PS0: Power State 0
                {
                    PGEN = Zero
                    PCRA (0xC0, 0x0600, 0xFFFFFE7A)
                    Sleep (0x02)
                    PCRO (0xC0, 0x0600, 0x0185)
                    PSTA &= 0xFFFFFFFC
                    TEMP = PSTA /* \_SB_.PCI0.PSDC.PSTA */
                }

                Method (_PS3, 0, Serialized)  // _PS3: Power State 3
                {
                    PGEN = One
                    PSTA |= 0x03
                    TEMP = PSTA /* \_SB_.PCI0.PSDC.PSTA */
                }

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (PCIC (Arg0))
                    {
                        Return (PCID (Arg0, Arg1, Arg2, Arg3))
                    }

                    If ((Arg0 == ToUUID ("f6c13ea5-65cd-461f-ab7a-29f7e8d5bd61") /* Unknown UUID */))
                    {
                        If ((Arg1 >= Zero))
                        {
                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x19                                             // .
                                    })
                                }
                                Case (0x03)
                                {
                                    Sleep (0x64)
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }
                                Case (0x04)
                                {
                                    Sleep (0x64)
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }

                            }
                        }
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (ISHD)
        {
            Name (_ADR, 0x00130000)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                If (CondRefOf (HIWC))
                {
                    If (HIWC (Arg0))
                    {
                        If (CondRefOf (HIDW))
                        {
                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (HECI)
        {
            Name (_ADR, 0x00160000)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                If (CondRefOf (HIWC))
                {
                    If (HIWC (Arg0))
                    {
                        If (CondRefOf (HIDW))
                        {
                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Name (S3FG, Zero)
    Name (ECUP, One)
    Mutex (EHLD, 0x00)
    Scope (\)
    {
        Device (CHUB)
        {
            Name (_HID, EisaId ("INT339B"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((CHEN == One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("1730e71d-e5dd-4a34-be57-4d76b6a2fe37") /* Unknown UUID */))
                {
                    If ((ToInteger (Arg1) >= Zero))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            Case (One)
                            {
                                Switch (ToInteger (DerefOf (Arg3 [Zero])))
                                {
                                    Case (Zero)
                                    {
                                    }

                                }
                            }

                        }

                        Return (Zero)
                    }

                    Return (Zero)
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (_SB)
    {
        OperationRegion (ITSS, SystemMemory, 0xFDC43100, 0x0208)
        Field (ITSS, ByteAcc, NoLock, Preserve)
        {
            PARC,   8, 
            PBRC,   8, 
            PCRC,   8, 
            PDRC,   8, 
            PERC,   8, 
            PFRC,   8, 
            PGRC,   8, 
            PHRC,   8, 
            Offset (0x200), 
                ,   1, 
                ,   1, 
            SCGE,   1
        }
    }

    Mutex (MUTX, 0x00)
    Event (NVEV)
    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    Method (D8XH, 2, Serialized)
    {
        If ((Arg0 == Zero))
        {
            P80D = ((P80D & 0xFFFFFF00) | Arg1)
        }

        If ((Arg0 == One))
        {
            P80D = ((P80D & 0xFFFF00FF) | (Arg1 << 0x08))
        }

        If ((Arg0 == 0x02))
        {
            P80D = ((P80D & 0xFF00FFFF) | (Arg1 << 0x10))
        }

        If ((Arg0 == 0x03))
        {
            P80D = ((P80D & 0x00FFFFFF) | (Arg1 << 0x18))
        }

        P80H = P80D /* \P80D */
    }

    Method (P8XH, 2, Serialized)
    {
        If (CondRefOf (MDBG))
        {
            D8XH (Arg0, Arg1)
        }
    }

    Method (ADBG, 1, Serialized)
    {
        If (CondRefOf (MDBG))
        {
            Return (MDBG (Arg0))
        }

        Return (Zero)
    }

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        GPIC = Arg0
        PICM = Arg0
    }

    Method (RPTS, 1, NotSerialized)
    {
        P80D = Zero
        D8XH (Zero, Arg0)
        ADBG (Concatenate ("_PTS=", ToHexString (Arg0)))
        Reset (NVEV)
        If ((Arg0 == 0x03))
        {
            If (CondRefOf (\_PR.DTSE))
            {
                If ((\_PR.DTSE && (TCNT > One)))
                {
                    TRAP (0x02, 0x1E)
                }
            }
        }

        If ((IVCM == One))
        {
            \_SB.SGOV (0x02040000, Zero)
            \_SB.SGOV (0x02010002, Zero)
        }

        If (CondRefOf (\_SB.TPM.PTS))
        {
            \_SB.TPM.PTS (Arg0)
        }

        If ((((Arg0 == 0x03) || (Arg0 == 0x04)) || (Arg0 == 0x05)))
        {
            If ((PFLV == 0x02))
            {
                \_SB.SGOV (0x02010003, One)
            }
        }
    }

    Method (RWAK, 1, Serialized)
    {
        D8XH (One, 0xAB)
        If ((\_PR.CFGD & 0x00400000))
        {
            If (\_SB.PCI0.LPCB.EC.ADP)
            {
                If (PIM1)
                {
                    IMXW = OIM1 /* \OIM1 */
                    IMMK = 0x02
                    PRM1 = 0x02
                    PRM0 = 0x0D
                    SSMP = 0xE0
                }
            }
            Else
            {
                CIM1 = IMXW /* \IMXW */
                IMXW = 0x5C
                IMMK = 0x02
                PRM1 = 0x02
                PRM0 = 0x0D
                SSMP = 0xE0
                IMXW = CIM1 /* \CIM1 */
            }
        }

        ADBG ("_WAK")
        If ((S0ID == One))
        {
            \_SB.SCGE = One
        }

        If (NEXP)
        {
            If ((OSCC & 0x02))
            {
                \_SB.PCI0.NHPG ()
            }

            If ((OSCC & 0x04))
            {
                \_SB.PCI0.NPME ()
            }
        }

        If ((Arg0 == 0x03))
        {
            S3FG = One
        }
        Else
        {
            S3FG = Zero
        }

        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            If (CondRefOf (\_PR.DTSE))
            {
                If ((\_PR.DTSE && (TCNT > One)))
                {
                    TRAP (0x02, 0x14)
                }
            }

            If ((\_SB.PCI0.RP01.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP01, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP02.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP02, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP03.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP03, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP04.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP04, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP05.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP05, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP06.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP06, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP07.VDID != 0xFFFFFFFF))
            {
                If ((DSTS == Zero))
                {
                    Notify (\_SB.PCI0.RP07, Zero) // Bus Check
                }
            }

            If ((\_SB.PCI0.RP08.VDID != 0xFFFFFFFF))
            {
                If ((DSTS == Zero))
                {
                    Notify (\_SB.PCI0.RP08, Zero) // Bus Check
                }
            }

            If ((\_SB.PCI0.RP09.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP09, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP10.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP10, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP11.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP11, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP12.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP12, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP13.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP13, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP14.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP14, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP15.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP15, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP16.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP16, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP17.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP17, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP18.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP18, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP19.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP19, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP20.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP20, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP21.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP21, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP22.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP22, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP23.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP23, Zero) // Bus Check
            }

            If ((\_SB.PCI0.RP24.VDID != 0xFFFFFFFF))
            {
                Notify (\_SB.PCI0.RP24, Zero) // Bus Check
            }
        }

        If (((Arg0 == 0x03) || (Arg0 == 0x04))){}
        Signal (NVEV)
        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    Method (GETB, 3, Serialized)
    {
        Local0 = (Arg0 * 0x08)
        Local1 = (Arg1 * 0x08)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3) /* \GETB.TBF3 */
    }

    Method (PNOT, 0, Serialized)
    {
        If ((TCNT > One))
        {
            If ((PC00 & 0x08))
            {
                Notify (\_PR.PR00, 0x80) // Performance Capability Change
            }

            If ((PC01 & 0x08))
            {
                Notify (\_PR.PR01, 0x80) // Performance Capability Change
            }

            If ((PC02 & 0x08))
            {
                Notify (\_PR.PR02, 0x80) // Performance Capability Change
            }

            If ((PC03 & 0x08))
            {
                Notify (\_PR.PR03, 0x80) // Performance Capability Change
            }

            If ((PC04 & 0x08))
            {
                Notify (\_PR.PR04, 0x80) // Performance Capability Change
            }

            If ((PC05 & 0x08))
            {
                Notify (\_PR.PR05, 0x80) // Performance Capability Change
            }

            If ((PC06 & 0x08))
            {
                Notify (\_PR.PR06, 0x80) // Performance Capability Change
            }

            If ((PC07 & 0x08))
            {
                Notify (\_PR.PR07, 0x80) // Performance Capability Change
            }

            If ((PC08 & 0x08))
            {
                Notify (\_PR.PR08, 0x80) // Performance Capability Change
            }

            If ((PC09 & 0x08))
            {
                Notify (\_PR.PR09, 0x80) // Performance Capability Change
            }

            If ((PC10 & 0x08))
            {
                Notify (\_PR.PR10, 0x80) // Performance Capability Change
            }

            If ((PC11 & 0x08))
            {
                Notify (\_PR.PR11, 0x80) // Performance Capability Change
            }

            If ((PC12 & 0x08))
            {
                Notify (\_PR.PR12, 0x80) // Performance Capability Change
            }

            If ((PC13 & 0x08))
            {
                Notify (\_PR.PR13, 0x80) // Performance Capability Change
            }

            If ((PC14 & 0x08))
            {
                Notify (\_PR.PR14, 0x80) // Performance Capability Change
            }

            If ((PC15 & 0x08))
            {
                Notify (\_PR.PR15, 0x80) // Performance Capability Change
            }
        }
        Else
        {
            Notify (\_PR.PR00, 0x80) // Performance Capability Change
        }

        If ((TCNT > One))
        {
            If (((PC00 & 0x08) && (PC00 & 0x10)))
            {
                Notify (\_PR.PR00, 0x81) // C-State Change
            }

            If (((PC01 & 0x08) && (PC01 & 0x10)))
            {
                Notify (\_PR.PR01, 0x81) // C-State Change
            }

            If (((PC02 & 0x08) && (PC02 & 0x10)))
            {
                Notify (\_PR.PR02, 0x81) // C-State Change
            }

            If (((PC03 & 0x08) && (PC03 & 0x10)))
            {
                Notify (\_PR.PR03, 0x81) // C-State Change
            }

            If (((PC04 & 0x08) && (PC04 & 0x10)))
            {
                Notify (\_PR.PR04, 0x81) // C-State Change
            }

            If (((PC05 & 0x08) && (PC05 & 0x10)))
            {
                Notify (\_PR.PR05, 0x81) // C-State Change
            }

            If (((PC06 & 0x08) && (PC06 & 0x10)))
            {
                Notify (\_PR.PR06, 0x81) // C-State Change
            }

            If (((PC07 & 0x08) && (PC07 & 0x10)))
            {
                Notify (\_PR.PR07, 0x81) // C-State Change
            }

            If (((PC08 & 0x08) && (PC08 & 0x10)))
            {
                Notify (\_PR.PR08, 0x81) // C-State Change
            }

            If (((PC09 & 0x08) && (PC09 & 0x10)))
            {
                Notify (\_PR.PR09, 0x81) // C-State Change
            }

            If (((PC10 & 0x08) && (PC10 & 0x10)))
            {
                Notify (\_PR.PR10, 0x81) // C-State Change
            }

            If (((PC11 & 0x08) && (PC11 & 0x10)))
            {
                Notify (\_PR.PR11, 0x81) // C-State Change
            }

            If (((PC12 & 0x08) && (PC12 & 0x10)))
            {
                Notify (\_PR.PR12, 0x81) // C-State Change
            }

            If (((PC13 & 0x08) && (PC13 & 0x10)))
            {
                Notify (\_PR.PR13, 0x81) // C-State Change
            }

            If (((PC14 & 0x08) && (PC14 & 0x10)))
            {
                Notify (\_PR.PR14, 0x81) // C-State Change
            }

            If (((PC15 & 0x08) && (PC15 & 0x10)))
            {
                Notify (\_PR.PR15, 0x81) // C-State Change
            }
        }
        Else
        {
            Notify (\_PR.PR00, 0x81) // C-State Change
        }
    }

    OperationRegion (MBAR, SystemMemory, (\_SB.PCI0.GMHB () + 0x5000), 0x1000)
    Field (MBAR, ByteAcc, NoLock, Preserve)
    {
        Offset (0x938), 
        PWRU,   4, 
        Offset (0x9A0), 
        PPL1,   15, 
        PL1E,   1, 
        CLP1,   1
    }

    Name (CLMP, Zero)
    Name (PLEN, Zero)
    Name (PLSV, 0x8000)
    Name (CSEM, Zero)
    Method (SPL1, 0, Serialized)
    {
        Name (PPUU, Zero)
        If ((CSEM == One))
        {
            Return (Zero)
        }

        CSEM = One
        PLSV = PPL1 /* \PPL1 */
        PLEN = PL1E /* \PL1E */
        CLMP = CLP1 /* \CLP1 */
        If ((PWRU == Zero))
        {
            PPUU = One
        }
        Else
        {
            PPUU = (PWRU-- << 0x02)
        }

        Local0 = (PLVL * PPUU) /* \SPL1.PPUU */
        Local1 = (Local0 / 0x03E8)
        PPL1 = Local1
        PL1E = One
        CLP1 = One
    }

    Method (RPL1, 0, Serialized)
    {
        PPL1 = PLSV /* \PLSV */
        PL1E = PLEN /* \PLEN */
        CLP1 = CLMP /* \CLMP */
        CSEM = Zero
    }

    Name (UAMS, Zero)
    Name (GLCK, Zero)
    Scope (\)
    {
        OperationRegion (IO_H, SystemIO, 0x1000, 0x04)
        Field (IO_H, ByteAcc, NoLock, Preserve)
        {
            TRPH,   8
        }
    }

    Method (TRAP, 2, Serialized)
    {
        SMIF = Arg1
        If ((Arg0 == 0x02))
        {
            \_PR.DTSF = Arg1
            \_PR.TRPD = Zero
            Return (\_PR.DTSF) /* External reference */
        }

        If ((Arg0 == 0x03))
        {
            TRPH = Zero
        }

        If ((Arg0 == 0x04))
        {
            \_PR.TRPF = Zero
        }

        Return (SMIF) /* \SMIF */
    }

    Scope (_SB.PCI0)
    {
        Method (PTMA, 0, NotSerialized)
        {
            Return (\_PR.BGMA) /* External reference */
        }

        Method (PTMS, 0, NotSerialized)
        {
            Return (\_PR.BGMS) /* External reference */
        }

        Method (PTIA, 0, NotSerialized)
        {
            Return (\_PR.BGIA) /* External reference */
        }

        Method (_INI, 0, Serialized)  // _INI: Initialize
        {
            OSYS = 0x07D0
            If (CondRefOf (\_OSI))
            {
                If (_OSI ("Windows 2001"))
                {
                    OSYS = 0x07D1
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    OSYS = 0x07D1
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    OSYS = 0x07D2
                }

                If (_OSI ("Windows 2001.1"))
                {
                    OSYS = 0x07D3
                }

                If (_OSI ("Windows 2006"))
                {
                    OSYS = 0x07D6
                }

                If (_OSI ("Windows 2009"))
                {
                    OSYS = 0x07D9
                }

                If (_OSI ("Windows 2012"))
                {
                    OSYS = 0x07DC
                }

                If (_OSI ("Windows 2013"))
                {
                    OSYS = 0x07DD
                }

                If (_OSI ("Windows 2015"))
                {
                    OSYS = 0x07DF
                }
            }
            ElseIf (MCTH (_OS, "Linux"))
            {
                OSYS = 0x03E8
            }

            If (CondRefOf (\_PR.DTSE))
            {
                If ((\_PR.DTSE >= One))
                {
                    \_PR.DSAE = One
                }
            }

            Signal (NVEV)
        }

        Method (MCTH, 2, NotSerialized)
        {
            If ((SizeOf (Arg0) < SizeOf (Arg1)))
            {
                Return (Zero)
            }

            Local0 = (SizeOf (Arg0) + One)
            Name (BUF0, Buffer (Local0){})
            Name (BUF1, Buffer (Local0){})
            BUF0 = Arg0
            BUF1 = Arg1
            While (Local0)
            {
                Local0--
                If ((DerefOf (BUF0 [Local0]) != DerefOf (BUF1 [Local0]
                    )))
                {
                    Return (Zero)
                }
            }

            Return (One)
        }

        Method (NHPG, 0, Serialized)
        {
            ^RP01.HPEX = Zero
            ^RP02.HPEX = Zero
            ^RP03.HPEX = Zero
            ^RP04.HPEX = Zero
            ^RP05.HPEX = Zero
            ^RP06.HPEX = Zero
            ^RP07.HPEX = Zero
            ^RP08.HPEX = Zero
            ^RP09.HPEX = Zero
            ^RP10.HPEX = Zero
            ^RP11.HPEX = Zero
            ^RP12.HPEX = Zero
            ^RP13.HPEX = Zero
            ^RP14.HPEX = Zero
            ^RP15.HPEX = Zero
            ^RP16.HPEX = Zero
            ^RP17.HPEX = Zero
            ^RP18.HPEX = Zero
            ^RP19.HPEX = Zero
            ^RP20.HPEX = Zero
            ^RP21.HPEX = Zero
            ^RP22.HPEX = Zero
            ^RP23.HPEX = Zero
            ^RP24.HPEX = Zero
            ^RP01.HPSX = One
            ^RP02.HPSX = One
            ^RP03.HPSX = One
            ^RP04.HPSX = One
            ^RP05.HPSX = One
            ^RP06.HPSX = One
            ^RP07.HPSX = One
            ^RP08.HPSX = One
            ^RP09.HPSX = One
            ^RP10.HPSX = One
            ^RP11.HPSX = One
            ^RP12.HPSX = One
            ^RP13.HPSX = One
            ^RP14.HPSX = One
            ^RP15.HPSX = One
            ^RP16.HPSX = One
            ^RP17.HPSX = One
            ^RP18.HPSX = One
            ^RP19.HPSX = One
            ^RP20.HPSX = One
            ^RP21.HPSX = One
            ^RP22.HPSX = One
            ^RP23.HPSX = One
            ^RP24.HPSX = One
        }

        Method (NPME, 0, Serialized)
        {
            ^RP01.PMEX = Zero
            ^RP02.PMEX = Zero
            ^RP03.PMEX = Zero
            ^RP04.PMEX = Zero
            ^RP05.PMEX = Zero
            ^RP06.PMEX = Zero
            ^RP07.PMEX = Zero
            ^RP08.PMEX = Zero
            ^RP09.PMEX = Zero
            ^RP10.PMEX = Zero
            ^RP11.PMEX = Zero
            ^RP12.PMEX = Zero
            ^RP13.PMEX = Zero
            ^RP14.PMEX = Zero
            ^RP15.PMEX = Zero
            ^RP16.PMEX = Zero
            ^RP17.PMEX = Zero
            ^RP18.PMEX = Zero
            ^RP19.PMEX = Zero
            ^RP20.PMEX = Zero
            ^RP21.PMEX = Zero
            ^RP22.PMEX = Zero
            ^RP23.PMEX = Zero
            ^RP24.PMEX = Zero
            ^RP01.PMSX = One
            ^RP02.PMSX = One
            ^RP03.PMSX = One
            ^RP04.PMSX = One
            ^RP05.PMSX = One
            ^RP06.PMSX = One
            ^RP07.PMSX = One
            ^RP08.PMSX = One
            ^RP09.PMSX = One
            ^RP10.PMSX = One
            ^RP11.PMSX = One
            ^RP12.PMSX = One
            ^RP13.PMSX = One
            ^RP14.PMSX = One
            ^RP15.PMSX = One
            ^RP16.PMSX = One
            ^RP17.PMSX = One
            ^RP18.PMSX = One
            ^RP19.PMSX = One
            ^RP20.PMSX = One
            ^RP21.PMSX = One
            ^RP22.PMSX = One
            ^RP23.PMSX = One
            ^RP24.PMSX = One
        }
    }

    Scope (\)
    {
        Name (PICM, Zero)
        Name (PRWP, Package (0x02)
        {
            Zero, 
            Zero
        })
        Method (GPRW, 2, NotSerialized)
        {
            PRWP [Zero] = Arg0
            Local0 = (SS1 << One)
            Local0 |= (SS2 << 0x02)
            Local0 |= (SS3 << 0x03)
            Local0 |= (SS4 << 0x04)
            If (((One << Arg1) & Local0))
            {
                PRWP [One] = Arg1
            }
            Else
            {
                Local0 >>= One
                FindSetLeftBit (Local0, PRWP [One])
            }

            Return (PRWP) /* \PRWP */
        }
    }

    Scope (_SB)
    {
        Name (OSCI, Zero)
        Name (OSCO, Zero)
        Name (OSCP, Zero)
        Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
        {
            CreateDWordField (Arg3, Zero, STS0)
            CreateDWordField (Arg3, 0x04, CAP0)
            If ((S0ID == One))
            {
                SCGE = One
            }

            If ((Arg0 == ToUUID ("0811b06e-4a27-44f9-8d60-3cbbc22e7b48") /* Platform-wide Capabilities */))
            {
                If ((Arg1 == One))
                {
                    OSCP = CAP0 /* \_SB_._OSC.CAP0 */
                    If ((CAP0 & 0x04))
                    {
                        OSCO = 0x04
                        If (((SGMD & 0x0F) != 0x02))
                        {
                            If ((RTD3 == Zero))
                            {
                                CAP0 &= 0x3B
                                STS0 |= 0x10
                            }
                        }
                    }
                }
                Else
                {
                    STS0 &= 0xFFFFFF00
                    STS0 |= 0x0A
                }
            }
            Else
            {
                STS0 &= 0xFFFFFF00
                STS0 |= 0x06
            }

            Return (Arg3)
        }

        Device (EPC)
        {
            Name (_HID, EisaId ("INT0E0C"))  // _HID: Hardware ID
            Name (_STR, Unicode ("Enclave Page Cache 1.0"))  // _STR: Description String
            Name (_MLS, Package (0x01)  // _MLS: Multiple Language String
            {
                Package (0x02)
                {
                    "en", 
                    Unicode ("Enclave Page Cache 1.0")
                }
            })
            Name (RBUF, Buffer (0x30)
            {
                /* 0000 */  0x8A, 0x2B, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00,  // .+......
                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79, 0x00   // ......y.
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateQWordField (RBUF, 0x0E, EMIN)
                CreateQWordField (RBUF, 0x16, EMAX)
                CreateQWordField (RBUF, 0x26, ELEN)
                EMIN = \_PR.EMNA /* External reference */
                ELEN = \_PR.ELNG /* External reference */
                EMAX = ((\_PR.EMNA + \_PR.ELNG) - One)
                Return (RBUF) /* \_SB_.EPC_.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_PR.EPCS != Zero))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB)
    {
        Device (BTKL)
        {
            Name (_HID, "INT3420" /* Intel Bluetooth RF Kill */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_PS0, 0, Serialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, Serialized)  // _PS3: Power State 3
            {
            }

            Method (PSTS, 0, NotSerialized)
            {
            }
        }
    }

    Scope (_SB)
    {
    }

    Scope (_SB)
    {
        Method (CGWR, 4, Serialized)
        {
            If ((Arg0 == One))
            {
                If (CondRefOf (\_SB.SGOV))
                {
                    SGOV (Arg2, Arg3)
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If (CondRefOf (\_SB.PCI0.GEXP.SGEP))
                {
                    ^PCI0.GEXP.SGEP (Arg1, Arg2, Arg3)
                }
            }
        }

        Method (CGRD, 4, Serialized)
        {
            Local0 = One
            If ((Arg0 == One))
            {
                If ((Arg3 == Zero))
                {
                    If (CondRefOf (\_SB.GGOV))
                    {
                        Local0 = GGOV (Arg2)
                    }
                }
                ElseIf ((Arg3 == One))
                {
                    If (CondRefOf (\_SB.GGIV))
                    {
                        Local0 = GGIV (Arg2)
                    }
                }
            }
            ElseIf ((Arg0 == 0x02))
            {
                If (CondRefOf (\_SB.PCI0.GEXP.GEPS))
                {
                    Local0 = ^PCI0.GEXP.GEPS (Arg1, Arg2)
                }
            }

            Return (Local0)
        }

        Method (WRGP, 2, Serialized)
        {
            Local0 = Arg0
            Local1 = Arg0
            Local0 &= 0xFFFFFFFF
            Local1 >>= 0x20
            If (((Local0 & 0xFF) == One))
            {
                CGWR ((Local0 & 0xFF), (Local1 >> 0x18), Local1, Arg1)
            }
            ElseIf (((Local0 & 0xFF) == 0x02))
            {
                CGWR ((Local0 & 0xFF), (Local1 >> 0x18), ((Local1 << 
                    0x08) >> 0x18), Arg1)
            }
        }

        Method (RDGP, 2, Serialized)
        {
            Local7 = One
            Local0 = Arg0
            Local1 = Arg0
            Local0 &= 0xFFFFFFFF
            Local1 >>= 0x20
            If (((Local0 & 0xFF) == One))
            {
                Local7 = CGRD ((Local0 & 0xFF), (Local1 >> 0x18), Local1, 
                    Arg1)
            }
            ElseIf (((Local0 & 0xFF) == 0x02))
            {
                Local7 = CGRD ((Local0 & 0xFF), (Local1 >> 0x18), (
                    (Local1 << 0x08) >> 0x18), Arg1)
            }

            Return (Local7)
        }
    }

    OperationRegion (_SB.PCI0.LPCB.LPCR, PCI_Config, 0x80, 0x04)
    Field (\_SB.PCI0.LPCB.LPCR, ByteAcc, NoLock, Preserve)
    {
        CARN,   3, 
            ,   1, 
        CBDR,   3, 
        Offset (0x01), 
        LTDR,   2, 
            ,   2, 
        FDDR,   1, 
        Offset (0x02), 
        CALE,   1, 
        CBLE,   1, 
        LTLE,   1, 
        FDLE,   1, 
        Offset (0x03), 
        GLLE,   1, 
        GHLE,   1, 
        KCLE,   1, 
        MCLE,   1, 
        C1LE,   1, 
        C2LE,   1, 
        Offset (0x04)
    }

    Method (UXDV, 1, Serialized)
    {
        Local0 = 0xFF
        Switch ((Arg0 + Zero))
        {
            Case (0x03F8)
            {
                Local0 = Zero
            }
            Case (0x02F8)
            {
                Local0 = One
            }
            Case (0x0220)
            {
                Local0 = 0x02
            }
            Case (0x0228)
            {
                Local0 = 0x03
            }
            Case (0x0238)
            {
                Local0 = 0x04
            }
            Case (0x02E8)
            {
                Local0 = 0x05
            }
            Case (0x0338)
            {
                Local0 = 0x06
            }
            Case (0x03E8)
            {
                Local0 = 0x07
            }

        }

        Return (Local0)
    }

    Method (RRIO, 4, Serialized)
    {
        Switch ((Arg0 + Zero))
        {
            Case (Zero)
            {
                CALE = Zero
                Local0 = UXDV (Arg2)
                If ((Local0 != 0xFF))
                {
                    CARN = Local0
                }

                If (Arg1)
                {
                    CALE = One
                }
            }
            Case (One)
            {
                CBLE = Zero
                Local0 = UXDV (Arg2)
                If ((Local0 != 0xFF))
                {
                    CBDR = Local0
                }

                If (Arg1)
                {
                    CBLE = One
                }
            }
            Case (0x02)
            {
                LTLE = Zero
                If ((Arg2 == 0x0378))
                {
                    LTDR = Zero
                }

                If ((Arg2 == 0x0278))
                {
                    LTDR = One
                }

                If ((Arg2 == 0x03BC))
                {
                    LTDR = 0x02
                }

                If (Arg1)
                {
                    LTLE = One
                }
            }
            Case (0x03)
            {
                FDLE = Zero
                If ((Arg2 == 0x03F0))
                {
                    FDDR = Zero
                }

                If ((Arg2 == 0x0370))
                {
                    FDDR = One
                }

                If (Arg1)
                {
                    FDLE = One
                }
            }
            Case (0x08)
            {
                If ((Arg2 == 0x0200))
                {
                    If (Arg1)
                    {
                        GLLE = One
                    }
                    Else
                    {
                        GLLE = Zero
                    }
                }

                If ((Arg2 == 0x0208))
                {
                    If (Arg1)
                    {
                        GHLE = One
                    }
                    Else
                    {
                        GHLE = Zero
                    }
                }
            }
            Case (0x09)
            {
                If ((Arg2 == 0x0200))
                {
                    If (Arg1)
                    {
                        GLLE = One
                    }
                    Else
                    {
                        GLLE = Zero
                    }
                }

                If ((Arg2 == 0x0208))
                {
                    If (Arg1)
                    {
                        GHLE = One
                    }
                    Else
                    {
                        GHLE = Zero
                    }
                }
            }
            Case (0x0A)
            {
                If (((Arg2 == 0x60) || (Arg2 == 0x64)))
                {
                    If (Arg1)
                    {
                        KCLE = One
                    }
                    Else
                    {
                        KCLE = Zero
                    }
                }
            }
            Case (0x0B)
            {
                If (((Arg2 == 0x62) || (Arg2 == 0x66)))
                {
                    If (Arg1)
                    {
                        MCLE = One
                    }
                    Else
                    {
                        MCLE = Zero
                    }
                }
            }
            Case (0x0C)
            {
                If ((Arg2 == 0x2E))
                {
                    If (Arg1)
                    {
                        C1LE = One
                    }
                    Else
                    {
                        C1LE = Zero
                    }
                }

                If ((Arg2 == 0x4E))
                {
                    If (Arg1)
                    {
                        C2LE = One
                    }
                    Else
                    {
                        C2LE = Zero
                    }
                }
            }
            Case (0x0D)
            {
                If ((Arg2 == 0x2E))
                {
                    If (Arg1)
                    {
                        C1LE = One
                    }
                    Else
                    {
                        C1LE = Zero
                    }
                }

                If ((Arg2 == 0x4E))
                {
                    If (Arg1)
                    {
                        C2LE = One
                    }
                    Else
                    {
                        C2LE = Zero
                    }
                }
            }

        }
    }

    Method (RDMA, 3, NotSerialized)
    {
    }

    Scope (_GPE)
    {
        Method (_L69, 0, Serialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            \_SB.PCI0.RP01.HPME ()
            \_SB.PCI0.RP02.HPME ()
            \_SB.PCI0.RP03.HPME ()
            \_SB.PCI0.RP04.HPME ()
            \_SB.PCI0.RP05.HPME ()
            \_SB.PCI0.RP06.HPME ()
            \_SB.PCI0.RP07.HPME ()
            \_SB.PCI0.RP08.HPME ()
            \_SB.PCI0.RP09.HPME ()
            \_SB.PCI0.RP10.HPME ()
            \_SB.PCI0.RP11.HPME ()
            \_SB.PCI0.RP12.HPME ()
            \_SB.PCI0.RP13.HPME ()
            \_SB.PCI0.RP14.HPME ()
            \_SB.PCI0.RP15.HPME ()
            \_SB.PCI0.RP16.HPME ()
            \_SB.PCI0.RP17.HPME ()
            \_SB.PCI0.RP18.HPME ()
            \_SB.PCI0.RP19.HPME ()
            \_SB.PCI0.RP20.HPME ()
            \_SB.PCI0.RP21.HPME ()
            \_SB.PCI0.RP22.HPME ()
            \_SB.PCI0.RP23.HPME ()
            \_SB.PCI0.RP24.HPME ()
            If ((\_SB.PCI0.D1F0 == One))
            {
                \_SB.PCI0.PEG0.HPME ()
                Notify (\_SB.PCI0.PEG0, 0x02) // Device Wake
                If ((S3FG == Zero))
                {
                    Notify (\_SB.PCI0.PEG0.PEGP, 0x02) // Device Wake
                    S3FG = Zero
                }
            }

            If ((\_SB.PCI0.D1F1 == One))
            {
                \_SB.PCI0.PEG1.HPME ()
                Notify (\_SB.PCI0.PEG1, 0x02) // Device Wake
            }

            If ((\_SB.PCI0.D1F2 == One))
            {
                \_SB.PCI0.PEG2.HPME ()
                Notify (\_SB.PCI0.PEG2, 0x02) // Device Wake
            }
        }

        Method (_L61, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            L01C += One
            P8XH (Zero, One)
            P8XH (One, L01C)
            If (((\_SB.PCI0.RP01.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP01.HPSX))
            {
                If (((TBTS != One) || (TBSE != One)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP01.PDCX)
                {
                    \_SB.PCI0.RP01.PDCX = One
                    \_SB.PCI0.RP01.HPSX = One
                    If (!\_SB.PCI0.RP01.PDSX)
                    {
                        \_SB.PCI0.RP01.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != One)))
                    {
                        Notify (\_SB.PCI0.RP01, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP01.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP02.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP02.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x02)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP02.PDCX)
                {
                    \_SB.PCI0.RP02.PDCX = One
                    \_SB.PCI0.RP02.HPSX = One
                    If (!\_SB.PCI0.RP02.PDSX)
                    {
                        \_SB.PCI0.RP02.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x02)))
                    {
                        Notify (\_SB.PCI0.RP02, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP02.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP03.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP03.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x03)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP03.PDCX)
                {
                    \_SB.PCI0.RP03.PDCX = One
                    \_SB.PCI0.RP03.HPSX = One
                    If (!\_SB.PCI0.RP03.PDSX)
                    {
                        \_SB.PCI0.RP03.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x03)))
                    {
                        Notify (\_SB.PCI0.RP03, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP03.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP04.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP04.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x04)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP04.PDCX)
                {
                    \_SB.PCI0.RP04.PDCX = One
                    \_SB.PCI0.RP04.HPSX = One
                    If (!\_SB.PCI0.RP04.PDSX)
                    {
                        \_SB.PCI0.RP04.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x04)))
                    {
                        Notify (\_SB.PCI0.RP04, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP04.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP05.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP05.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x05)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP05.PDCX)
                {
                    \_SB.PCI0.RP05.PDCX = One
                    \_SB.PCI0.RP05.HPSX = One
                    If (!\_SB.PCI0.RP05.PDSX)
                    {
                        \_SB.PCI0.RP05.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x05)))
                    {
                        Notify (\_SB.PCI0.RP05, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP05.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP06.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP06.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x06)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP06.PDCX)
                {
                    \_SB.PCI0.RP06.PDCX = One
                    \_SB.PCI0.RP06.HPSX = One
                    If (!\_SB.PCI0.RP06.PDSX)
                    {
                        \_SB.PCI0.RP06.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x06)))
                    {
                        Notify (\_SB.PCI0.RP06, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP06.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP07.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP07.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x07)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP07.PDCX)
                {
                    \_SB.PCI0.RP07.PDCX = One
                    \_SB.PCI0.RP07.HPSX = One
                    If (!\_SB.PCI0.RP07.PDSX)
                    {
                        \_SB.PCI0.RP07.L0SE = Zero
                    }

                    If ((PFLV == 0x02))
                    {
                        If (((TBTS != One) || (TBSE != 0x07)))
                        {
                            Notify (\_SB.PCI0.RP07, Zero) // Bus Check
                        }
                    }
                    Else
                    {
                    }
                }
                Else
                {
                    \_SB.PCI0.RP07.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP08.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP08.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x08)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP08.PDCX)
                {
                    \_SB.PCI0.RP08.PDCX = One
                    \_SB.PCI0.RP08.HPSX = One
                    If (!\_SB.PCI0.RP08.PDSX)
                    {
                        \_SB.PCI0.RP08.L0SE = Zero
                    }

                    If ((PFLV == 0x02))
                    {
                        If (((TBTS != One) || (TBSE != 0x08)))
                        {
                            Notify (\_SB.PCI0.RP08, Zero) // Bus Check
                        }
                    }
                    Else
                    {
                    }
                }
                Else
                {
                    \_SB.PCI0.RP08.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP09.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP09.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x09)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP09.PDCX)
                {
                    \_SB.PCI0.RP09.PDCX = One
                    \_SB.PCI0.RP09.HPSX = One
                    If (!\_SB.PCI0.RP09.PDSX)
                    {
                        \_SB.PCI0.RP09.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x09)))
                    {
                        Notify (\_SB.PCI0.RP09, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP09.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP10.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP10.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x0A)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP10.PDCX)
                {
                    \_SB.PCI0.RP10.PDCX = One
                    \_SB.PCI0.RP10.HPSX = One
                    If (!\_SB.PCI0.RP10.PDSX)
                    {
                        \_SB.PCI0.RP10.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x0A)))
                    {
                        Notify (\_SB.PCI0.RP10, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP10.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP11.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP11.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x0B)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP11.PDCX)
                {
                    \_SB.PCI0.RP11.PDCX = One
                    \_SB.PCI0.RP11.HPSX = One
                    If (!\_SB.PCI0.RP11.PDSX)
                    {
                        \_SB.PCI0.RP11.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x0B)))
                    {
                        Notify (\_SB.PCI0.RP11, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP11.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP12.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP12.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x0C)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP12.PDCX)
                {
                    \_SB.PCI0.RP12.PDCX = One
                    \_SB.PCI0.RP12.HPSX = One
                    If (!\_SB.PCI0.RP12.PDSX)
                    {
                        \_SB.PCI0.RP12.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x0C)))
                    {
                        Notify (\_SB.PCI0.RP12, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP12.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP13.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP13.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x0D)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP13.PDCX)
                {
                    \_SB.PCI0.RP13.PDCX = One
                    \_SB.PCI0.RP13.HPSX = One
                    If (!\_SB.PCI0.RP13.PDSX)
                    {
                        \_SB.PCI0.RP13.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x0D)))
                    {
                        Notify (\_SB.PCI0.RP13, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP13.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP14.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP14.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x0E)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP14.PDCX)
                {
                    \_SB.PCI0.RP14.PDCX = One
                    \_SB.PCI0.RP14.HPSX = One
                    If (!\_SB.PCI0.RP14.PDSX)
                    {
                        \_SB.PCI0.RP14.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x0E)))
                    {
                        Notify (\_SB.PCI0.RP14, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP14.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP15.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP15.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x0F)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP15.PDCX)
                {
                    \_SB.PCI0.RP15.PDCX = One
                    \_SB.PCI0.RP15.HPSX = One
                    If (!\_SB.PCI0.RP15.PDSX)
                    {
                        \_SB.PCI0.RP15.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x0F)))
                    {
                        Notify (\_SB.PCI0.RP15, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP15.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP16.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP16.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x10)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP16.PDCX)
                {
                    \_SB.PCI0.RP16.PDCX = One
                    \_SB.PCI0.RP16.HPSX = One
                    If (!\_SB.PCI0.RP16.PDSX)
                    {
                        \_SB.PCI0.RP16.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x10)))
                    {
                        Notify (\_SB.PCI0.RP16, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP16.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP17.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP17.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x11)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP17.PDCX)
                {
                    \_SB.PCI0.RP17.PDCX = One
                    \_SB.PCI0.RP17.HPSX = One
                    If (!\_SB.PCI0.RP17.PDSX)
                    {
                        \_SB.PCI0.RP17.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x11)))
                    {
                        Notify (\_SB.PCI0.RP17, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP17.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP18.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP18.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x12)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP18.PDCX)
                {
                    \_SB.PCI0.RP18.PDCX = One
                    \_SB.PCI0.RP18.HPSX = One
                    If (!\_SB.PCI0.RP18.PDSX)
                    {
                        \_SB.PCI0.RP18.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x12)))
                    {
                        Notify (\_SB.PCI0.RP18, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP18.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP19.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP19.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x13)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP19.PDCX)
                {
                    \_SB.PCI0.RP19.PDCX = One
                    \_SB.PCI0.RP19.HPSX = One
                    If (!\_SB.PCI0.RP19.PDSX)
                    {
                        \_SB.PCI0.RP19.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x13)))
                    {
                        Notify (\_SB.PCI0.RP19, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP19.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP20.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP20.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x14)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP20.PDCX)
                {
                    \_SB.PCI0.RP20.PDCX = One
                    \_SB.PCI0.RP20.HPSX = One
                    If (!\_SB.PCI0.RP20.PDSX)
                    {
                        \_SB.PCI0.RP20.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x14)))
                    {
                        Notify (\_SB.PCI0.RP20, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP20.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP21.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP21.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x15)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP21.PDCX)
                {
                    \_SB.PCI0.RP21.PDCX = One
                    \_SB.PCI0.RP21.HPSX = One
                    If (!\_SB.PCI0.RP21.PDSX)
                    {
                        \_SB.PCI0.RP21.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x15)))
                    {
                        Notify (\_SB.PCI0.RP21, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP21.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP22.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP22.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x16)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP22.PDCX)
                {
                    \_SB.PCI0.RP22.PDCX = One
                    \_SB.PCI0.RP22.HPSX = One
                    If (!\_SB.PCI0.RP22.PDSX)
                    {
                        \_SB.PCI0.RP22.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x16)))
                    {
                        Notify (\_SB.PCI0.RP22, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP22.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP23.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP23.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x17)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP23.PDCX)
                {
                    \_SB.PCI0.RP23.PDCX = One
                    \_SB.PCI0.RP23.HPSX = One
                    If (!\_SB.PCI0.RP23.PDSX)
                    {
                        \_SB.PCI0.RP23.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x17)))
                    {
                        Notify (\_SB.PCI0.RP23, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP23.HPSX = One
                }
            }

            If (((\_SB.PCI0.RP24.VDID != 0xFFFFFFFF) && \_SB.PCI0.RP24.HPSX))
            {
                If (((TBTS != One) || (TBSE != 0x18)))
                {
                    Sleep (0x64)
                }

                If (\_SB.PCI0.RP24.PDCX)
                {
                    \_SB.PCI0.RP24.PDCX = One
                    \_SB.PCI0.RP24.HPSX = One
                    If (!\_SB.PCI0.RP24.PDSX)
                    {
                        \_SB.PCI0.RP24.L0SE = Zero
                    }

                    If (((TBTS != One) || (TBSE != 0x18)))
                    {
                        Notify (\_SB.PCI0.RP24, Zero) // Bus Check
                    }
                }
                Else
                {
                    \_SB.PCI0.RP24.HPSX = One
                }
            }
        }

        Method (_L62, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            GPEC = Zero
            If (CondRefOf (\_PR.DTSE))
            {
                If ((\_PR.DTSE >= One))
                {
                    If ((\_PR.DTSI == One))
                    {
                        \_PR.DTSI = Zero
                    }
                }
            }

            If ((\_PR.HWPI == One))
            {
                If (CondRefOf (\_GPE.HLVT))
                {
                    HLVT ()
                }

                \_PR.HWPI = Zero
            }

            If ((\_SB.AC.IGNR == Zero))
            {
                PNOT ()
            }
        }

        Method (_L66, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            If ((\_SB.PCI0.GFX0.GSSE && !GSMI))
            {
                \_SB.PCI0.GFX0.GSCI ()
            }
        }

        Method (XSWI, 0, NotSerialized)
        {
            If (\_SB.PCI0.LPCB.EC.ECOK)
            {
                If ((\_SB.PCI0.LPCB.EC.WFNO == One))
                {
                    If (((PSF0 & 0x10) == Zero))
                    {
                        If (LIDS)
                        {
                            \_SB.PCI0.GFX0.CLID = 0x03
                        }
                        Else
                        {
                            \_SB.PCI0.GFX0.CLID = Zero
                        }
                    }

                    Notify (\_SB.LID0, 0x80) // Status Change
                }
            }
        }

        Method (_L6F, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            If ((RTD3 == One))
            {
                If (CondRefOf (\_GPE.AL6F))
                {
                    AL6F ()
                }
            }

            If (\_SB.ISME (0x01080003))
            {
                \_SB.CAGS (0x01080003)
                Wait (NVEV, 0xFFFF)
                Signal (NVEV)
                If ((\_SB.GGIV (0x01080003) == One))
                {
                    Notify (\_SB.PCI0.PEG0.PEGP, 0x81) // Information Change
                }
            }

            If (\_SB.ISME (0x01080001))
            {
                \_SB.CAGS (0x01080001)
                Wait (NVEV, 0xFFFF)
                Signal (NVEV)
                If ((\_SB.GGIV (0x01080001) == One))
                {
                    Notify (\_SB.PCI0.PEG0.PEGP, 0x81) // Information Change
                }
            }

            \_SB.CGPS ()
        }
    }

    Scope (_SB.PCI0.GFX0)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_SB.PCI0.ISP0)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_SB.PCI0.SAT0)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((((S0ID == One) || (OSYS >= 0x07DF)) && (
                (PEPC & 0x03) != Zero)))
            {
                Return (Package (0x01)
                {
                    PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_SB.PCI0.SAT0.VOL0)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((OSYS == 0x07DD))
            {
                Return (Package (0x00){})
            }

            Return (Package (0x01)
            {
                PEPD, 
            })
        }
    }

    If (((S0ID == One) || (OSYS >= 0x07DF)))
    {
        Scope (_SB.PCI0.I2C0)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.I2C1)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.I2C2)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.I2C3)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.I2C4)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.I2C5)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.SPI0)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.SPI1)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.UA00)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.UA01)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.UA02)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }

        Scope (_SB.PCI0.HECI)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                PEPD, 
            })
        }
    }

    Scope (_SB.PCI0.XHC)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_SB.PCI0.HDAS)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((S0ID == One))
            {
                Return (Package (0x01)
                {
                    PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.RP01.PXSX))
    {
        Scope (_SB.PCI0.RP01.PXSX)
        {
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                If ((PAHC () || PNVM ()))
                {
                    If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                        (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                    {
                        Return (Package (0x01)
                        {
                            PEPD, 
                        })
                    }
                }

                Return (Package (0x00){})
            }

            OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
            Field (PCCX, ByteAcc, NoLock, Preserve)
            {
                PIXX,   8, 
                SCCX,   8, 
                BCCX,   8
            }

            Method (PAHC, 0, Serialized)
            {
                If ((BCCX == One))
                {
                    If ((SCCX == 0x06))
                    {
                        If ((PIXX == One))
                        {
                            Return (One)
                        }
                    }
                }

                Return (Zero)
            }

            Method (PNVM, 0, Serialized)
            {
                If ((BCCX == One))
                {
                    If ((SCCX == 0x08))
                    {
                        If ((PIXX == 0x02))
                        {
                            Return (One)
                        }
                    }
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.RP02.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP03.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP04.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    If (CondRefOf (\_SB.PCI0.RP05.PXSX))
    {
        Scope (_SB.PCI0.RP05.PXSX)
        {
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                If ((PAHC () || PNVM ()))
                {
                    If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                        (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                    {
                        Return (Package (0x01)
                        {
                            PEPD, 
                        })
                    }
                }

                Return (Package (0x00){})
            }

            OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
            Field (PCCX, ByteAcc, NoLock, Preserve)
            {
                PIXX,   8, 
                SCCX,   8, 
                BCCX,   8
            }

            Method (PAHC, 0, Serialized)
            {
                If ((BCCX == One))
                {
                    If ((SCCX == 0x06))
                    {
                        If ((PIXX == One))
                        {
                            Return (One)
                        }
                    }
                }

                Return (Zero)
            }

            Method (PNVM, 0, Serialized)
            {
                If ((BCCX == One))
                {
                    If ((SCCX == 0x08))
                    {
                        If ((PIXX == 0x02))
                        {
                            Return (One)
                        }
                    }
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.RP06.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP07.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP08.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    If (CondRefOf (\_SB.PCI0.RP09.PXSX))
    {
        Scope (_SB.PCI0.RP09.PXSX)
        {
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                If ((PAHC () || PNVM ()))
                {
                    If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                        (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                    {
                        Return (Package (0x01)
                        {
                            PEPD, 
                        })
                    }
                }

                Return (Package (0x00){})
            }

            OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
            Field (PCCX, ByteAcc, NoLock, Preserve)
            {
                PIXX,   8, 
                SCCX,   8, 
                BCCX,   8
            }

            Method (PAHC, 0, Serialized)
            {
                If ((BCCX == One))
                {
                    If ((SCCX == 0x06))
                    {
                        If ((PIXX == One))
                        {
                            Return (One)
                        }
                    }
                }

                Return (Zero)
            }

            Method (PNVM, 0, Serialized)
            {
                If ((BCCX == One))
                {
                    If ((SCCX == 0x08))
                    {
                        If ((PIXX == 0x02))
                        {
                            Return (One)
                        }
                    }
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.RP10.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP11.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP12.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP13.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP14.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP15.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP16.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP17.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP18.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP19.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_SB.PCI0.RP20.PXSX)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If ((PAHC () || PNVM ()))
            {
                If ((((S0ID == One) || (OSYS >= 0x07DF)) && ((
                    (PEPC & 0x0400) == 0x0400) || ((PEPC & 0x0800) == 0x0800))))
                {
                    Return (Package (0x01)
                    {
                        PEPD, 
                    })
                }
            }

            Return (Package (0x00){})
        }

        OperationRegion (PCCX, PCI_Config, 0x09, 0x04)
        Field (PCCX, ByteAcc, NoLock, Preserve)
        {
            PIXX,   8, 
            SCCX,   8, 
            BCCX,   8
        }

        Method (PAHC, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x06))
                {
                    If ((PIXX == One))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }

        Method (PNVM, 0, Serialized)
        {
            If ((BCCX == One))
            {
                If ((SCCX == 0x08))
                {
                    If ((PIXX == 0x02))
                    {
                        Return (One)
                    }
                }
            }

            Return (Zero)
        }
    }

    Scope (_PR.PR00)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR01)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR02)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR03)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            ADBG ("PR03 DEP Call")
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR04)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR05)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR06)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR07)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR08)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR09)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR10)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR11)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR12)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR13)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR14)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_PR.PR15)
    {
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            If (((S0ID == One) || (OSYS >= 0x07DF)))
            {
                Return (Package (0x01)
                {
                    \_SB.PEPD, 
                })
            }
            Else
            {
                Return (Package (0x00){})
            }
        }
    }

    Scope (_SB)
    {
        Device (PEPD)
        {
            Name (_HID, "INT33A1" /* Intel Power Engine */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0D80") /* Windows-compatible System Power Management Controller */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (DEVY, Package (0x41)
            {
                Package (0x03)
                {
                    "\\_PR.PR00", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR01", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR02", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR03", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR04", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR05", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR06", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR07", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.GFX0", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.UA00", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.UA01", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.I2C0", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.I2C1", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.XHC", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.HDAS", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.PEMC", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.PSDC", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.I2C2", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.I2C3", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.I2C4", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.I2C5", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.UA02", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SPI0", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SPI1", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP01.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP02.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP03.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP04.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP05.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP06.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP07.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP08.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP09.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP10.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP11.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP12.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP13.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP14.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP15.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP16.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP17.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP18.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP19.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.RP20.PXSX", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.ISP0", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.PRT0", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.PRT1", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.PRT2", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.PRT3", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.PRT4", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.PRT5", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.NVM1", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.NVM2", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.NVM3", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            0x03
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.SAT0.VOL0", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR08", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR09", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR10", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR11", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR12", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR13", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR14", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_PR.PR15", 
                    Zero, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x02)
                        {
                            0xFF, 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "\\_SB.PCI0.HECI", 
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        Package (0x03)
                        {
                            0xFF, 
                            Zero, 
                            0x81
                        }
                    }
                }
            })
            Name (BCCD, Package (0x1A)
            {
                Package (0x02)
                {
                    "\\_SB.PCI0.SAT0", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x3E80
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.SAT0.PRT0", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x3E80
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.SAT0.PRT1", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x3E80
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.SAT0.PRT2", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x3E80
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.SAT0.PRT3", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x3E80
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.SAT0.VOL0", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x3E80
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP01.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP02.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP03.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP04.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP05.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP06.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP07.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP08.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP09.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP10.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP11.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP12.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP13.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP14.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP15.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP16.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP17.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP18.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP19.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }, 

                Package (0x02)
                {
                    "\\_SB.PCI0.RP20.PXSX", 
                    Package (0x01)
                    {
                        Package (0x03)
                        {
                            Package (0x05)
                            {
                                One, 
                                0x08, 
                                Zero, 
                                One, 
                                0xB2
                            }, 

                            Package (0x03)
                            {
                                Zero, 
                                0xCD, 
                                One
                            }, 

                            0x000186A0
                        }
                    }
                }
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((OSYS >= 0x07DF) || ((OSYS >= 0x07DC) && (
                    S0ID == One))))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("c4eb40a0-6cd2-11e2-bcfd-0800200c9a66") /* Modern Standby Intel */))
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x7F                                             // .
                        })
                    }

                    If ((Arg2 == One))
                    {
                        If ((S0ID == Zero))
                        {
                            Return (Package (0x00){})
                        }

                        If (((PEPC & 0x00100000) != Zero))
                        {
                            If ((SPST != Zero))
                            {
                                DerefOf (DEVY [0x09]) [One] = One
                            }

                            If (CondRefOf (\_SB.PCI0.RP01.PXSX))
                            {
                                If ((^^PCI0.RP01.PXSX.PAHC () || ^^PCI0.RP01.PXSX.PNVM ()))
                                {
                                    DerefOf (DEVY [0x19]) [One] = One
                                }
                            }

                            If ((^^PCI0.RP02.PXSX.PAHC () || ^^PCI0.RP02.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x1A]) [One] = One
                            }

                            If ((^^PCI0.RP03.PXSX.PAHC () || ^^PCI0.RP03.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x1B]) [One] = One
                            }

                            If ((^^PCI0.RP04.PXSX.PAHC () || ^^PCI0.RP04.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x1C]) [One] = One
                            }

                            If (CondRefOf (\_SB.PCI0.RP05.PXSX))
                            {
                                If ((^^PCI0.RP05.PXSX.PAHC () || ^^PCI0.RP05.PXSX.PNVM ()))
                                {
                                    DerefOf (DEVY [0x1D]) [One] = One
                                }
                            }

                            If ((^^PCI0.RP06.PXSX.PAHC () || ^^PCI0.RP06.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x1E]) [One] = One
                            }

                            If ((^^PCI0.RP07.PXSX.PAHC () || ^^PCI0.RP07.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x1F]) [One] = One
                            }

                            If ((^^PCI0.RP08.PXSX.PAHC () || ^^PCI0.RP08.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x20]) [One] = One
                            }

                            If (CondRefOf (\_SB.PCI0.RP09.PXSX))
                            {
                                If ((^^PCI0.RP09.PXSX.PAHC () || ^^PCI0.RP09.PXSX.PNVM ()))
                                {
                                    DerefOf (DEVY [0x21]) [One] = One
                                }
                            }

                            If ((^^PCI0.RP10.PXSX.PAHC () || ^^PCI0.RP10.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x22]) [One] = One
                            }

                            If ((^^PCI0.RP11.PXSX.PAHC () || ^^PCI0.RP11.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x23]) [One] = One
                            }

                            If ((^^PCI0.RP12.PXSX.PAHC () || ^^PCI0.RP12.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x24]) [One] = One
                            }

                            If ((^^PCI0.RP13.PXSX.PAHC () || ^^PCI0.RP13.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x25]) [One] = One
                            }

                            If ((^^PCI0.RP14.PXSX.PAHC () || ^^PCI0.RP14.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x26]) [One] = One
                            }

                            If ((^^PCI0.RP15.PXSX.PAHC () || ^^PCI0.RP15.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x27]) [One] = One
                            }

                            If ((^^PCI0.RP16.PXSX.PAHC () || ^^PCI0.RP16.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x28]) [One] = One
                            }

                            If ((^^PCI0.RP17.PXSX.PAHC () || ^^PCI0.RP17.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x29]) [One] = One
                            }

                            If ((^^PCI0.RP18.PXSX.PAHC () || ^^PCI0.RP18.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x2A]) [One] = One
                            }

                            If ((^^PCI0.RP19.PXSX.PAHC () || ^^PCI0.RP19.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x2B]) [One] = One
                            }

                            If ((^^PCI0.RP20.PXSX.PAHC () || ^^PCI0.RP20.PXSX.PNVM ()))
                            {
                                DerefOf (DEVY [0x2C]) [One] = One
                            }
                        }

                        If (((PEPC & 0x00200000) != Zero))
                        {
                            DerefOf (DEVY [0x37]) [One] = One
                        }

                        If (((PEPC & 0x00400000) != Zero))
                        {
                            DerefOf (DEVY [0x2E]) [One] = One
                        }

                        If (((PEPC & 0x00800000) != Zero))
                        {
                            DerefOf (DEVY [0x2F]) [One] = One
                        }

                        If (((PEPC & 0x01000000) != Zero))
                        {
                            DerefOf (DEVY [0x30]) [One] = One
                        }

                        If (((PEPC & 0x02000000) != Zero))
                        {
                            DerefOf (DEVY [0x31]) [One] = One
                        }

                        If (((PEPC & 0x04000000) != Zero))
                        {
                            DerefOf (DEVY [0x32]) [One] = One
                        }

                        If (((PEPC & 0x08000000) != Zero))
                        {
                            DerefOf (DEVY [0x33]) [One] = One
                        }

                        If (((PEPC & 0x10000000) != Zero))
                        {
                            DerefOf (DEVY [0x34]) [One] = One
                        }

                        If (((PEPC & 0x20000000) != Zero))
                        {
                            DerefOf (DEVY [0x35]) [One] = One
                        }

                        If (((PEPC & 0x40000000) != Zero))
                        {
                            DerefOf (DEVY [0x36]) [One] = One
                        }

                        If (((PEPC & 0x80000000) == Zero))
                        {
                            DerefOf (DEVY [0x40]) [One] = Zero
                        }

                        If (((PEPC & 0x04) == Zero))
                        {
                            DerefOf (DEVY [0x0A]) [One] = Zero
                        }

                        If (((PEPC & 0x08) == Zero))
                        {
                            DerefOf (DEVY [0x0B]) [One] = Zero
                        }

                        If (((PEPC & 0x10) == Zero)){}
                        If (((PEPC & 0x20) == Zero))
                        {
                            DerefOf (DEVY [0x0C]) [One] = Zero
                        }

                        If (((PEPC & 0x40) == Zero))
                        {
                            DerefOf (DEVY [0x0D]) [One] = Zero
                        }

                        If (((PEPC & 0x80) == Zero))
                        {
                            DerefOf (DEVY [0x0E]) [One] = Zero
                        }

                        If (((PEPC & 0x0100) == Zero))
                        {
                            DerefOf (DEVY [0x0F]) [One] = Zero
                        }

                        If (((PEPC & 0x0200) == Zero))
                        {
                            DerefOf (DEVY [0x08]) [One] = Zero
                        }

                        If ((TCNT >= One))
                        {
                            DerefOf (DEVY [Zero]) [One] = One
                        }

                        If ((TCNT >= 0x02))
                        {
                            DerefOf (DEVY [One]) [One] = One
                        }

                        If ((TCNT >= 0x03))
                        {
                            DerefOf (DEVY [0x02]) [One] = One
                        }

                        If ((TCNT >= 0x04))
                        {
                            DerefOf (DEVY [0x03]) [One] = One
                        }

                        If ((TCNT >= 0x05))
                        {
                            DerefOf (DEVY [0x04]) [One] = One
                        }

                        If ((TCNT >= 0x06))
                        {
                            DerefOf (DEVY [0x05]) [One] = One
                        }

                        If ((TCNT >= 0x07))
                        {
                            DerefOf (DEVY [0x06]) [One] = One
                        }

                        If ((TCNT >= 0x08))
                        {
                            DerefOf (DEVY [0x07]) [One] = One
                        }

                        If ((TCNT >= 0x09))
                        {
                            DerefOf (DEVY [0x38]) [One] = One
                        }

                        If ((TCNT >= 0x0A))
                        {
                            DerefOf (DEVY [0x39]) [One] = One
                        }

                        If ((TCNT >= 0x0B))
                        {
                            DerefOf (DEVY [0x3A]) [One] = One
                        }

                        If ((TCNT >= 0x0C))
                        {
                            DerefOf (DEVY [0x3B]) [One] = One
                        }

                        If ((TCNT >= 0x0D))
                        {
                            DerefOf (DEVY [0x3C]) [One] = One
                        }

                        If ((TCNT >= 0x0E))
                        {
                            DerefOf (DEVY [0x3D]) [One] = One
                        }

                        If ((TCNT >= 0x0F))
                        {
                            DerefOf (DEVY [0x3E]) [One] = One
                        }

                        If ((TCNT >= 0x10))
                        {
                            DerefOf (DEVY [0x3F]) [One] = One
                        }

                        If (((PEPC & 0x0400) == Zero))
                        {
                            DerefOf (DEVY [Zero]) [One] = Zero
                            DerefOf (DEVY [One]) [One] = Zero
                            DerefOf (DEVY [0x02]) [One] = Zero
                            DerefOf (DEVY [0x03]) [One] = Zero
                            DerefOf (DEVY [0x04]) [One] = Zero
                            DerefOf (DEVY [0x05]) [One] = Zero
                            DerefOf (DEVY [0x06]) [One] = Zero
                            DerefOf (DEVY [0x07]) [One] = Zero
                            DerefOf (DEVY [0x38]) [One] = Zero
                            DerefOf (DEVY [0x39]) [One] = Zero
                            DerefOf (DEVY [0x3A]) [One] = Zero
                            DerefOf (DEVY [0x3B]) [One] = Zero
                            DerefOf (DEVY [0x3C]) [One] = Zero
                            DerefOf (DEVY [0x3D]) [One] = Zero
                            DerefOf (DEVY [0x3E]) [One] = Zero
                            DerefOf (DEVY [0x3F]) [One] = Zero
                        }

                        If (((PEPC & 0x0800) == Zero))
                        {
                            DerefOf (DEVY [0x10]) [One] = Zero
                        }

                        If (((PEPC & 0x1000) == Zero))
                        {
                            DerefOf (DEVY [0x11]) [One] = Zero
                        }

                        If (((PEPC & 0x2000) == Zero))
                        {
                            DerefOf (DEVY [0x12]) [One] = Zero
                        }

                        If (((PEPC & 0x4000) == Zero))
                        {
                            DerefOf (DEVY [0x13]) [One] = Zero
                        }

                        If (((PEPC & 0x8000) == Zero))
                        {
                            DerefOf (DEVY [0x14]) [One] = Zero
                        }

                        If (((PEPC & 0x00010000) == Zero))
                        {
                            DerefOf (DEVY [0x15]) [One] = Zero
                        }

                        If (((PEPC & 0x00020000) == Zero))
                        {
                            DerefOf (DEVY [0x16]) [One] = Zero
                        }

                        If (((PEPC & 0x00040000) == Zero))
                        {
                            DerefOf (DEVY [0x17]) [One] = Zero
                        }

                        If (((PEPC & 0x00080000) == Zero))
                        {
                            DerefOf (DEVY [0x18]) [One] = Zero
                        }

                        If (((PEPC & 0x02) == Zero))
                        {
                            DerefOf (DEVY [0x2D]) [One] = Zero
                        }

                        If ((OSYS >= 0x07DF))
                        {
                            If (CondRefOf (\_SB.PCI0.RP01.PXSX)){}
                            If (CondRefOf (\_SB.PCI0.RP05.PXSX)){}
                            If (CondRefOf (\_SB.PCI0.RP09.PXSX)){}
                        }

                        If (((OSYS >= 0x07DF) && (PWIG == One)))
                        {
                            If (CondRefOf (\_SB.PCI0.RP01.PXSX)){}
                            If (CondRefOf (\_SB.PCI0.RP01.PXSX)){}
                            If (CondRefOf (\_SB.PCI0.RP01.PXSX)){}
                        }

                        Return (DEVY) /* \_SB_.PEPD.DEVY */
                    }

                    If ((Arg2 == 0x02))
                    {
                        Return (BCCD) /* \_SB_.PEPD.BCCD */
                    }

                    If ((Arg2 == 0x03))
                    {
                        If ((S0ID == One)){}
                    }

                    If ((Arg2 == 0x04))
                    {
                        If ((S0ID == One)){}
                    }

                    If ((Arg2 == 0x05))
                    {
                        If ((S0ID == One)){}
                    }

                    If ((Arg2 == 0x06))
                    {
                        If ((S0ID == One)){}
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Device (_SB.TPM)
    {
        Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
        {
            If (TCMF)
            {
                Return (0x01013469)
            }
            ElseIf ((TTDP == Zero))
            {
                Return (0x310CD041)
            }
            Else
            {
                Return ("MSFT0101")
            }
        }

        Method (_STR, 0, NotSerialized)  // _STR: Description String
        {
            If ((TTDP == Zero))
            {
                Return (Unicode ("TPM 1.2 Device"))
            }
            Else
            {
                Return (Unicode ("TPM 2.0 Device"))
            }
        }

        Name (_UID, One)  // _UID: Unique ID
        Name (CRST, Buffer (0x1A)
        {
            /* 0000 */  0x86, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x10, 0x00, 0x00, 0x86, 0x09, 0x00, 0x00,  // ........
            /* 0010 */  0x00, 0x00, 0xD7, 0xFE, 0x00, 0x10, 0x00, 0x00,  // ........
            /* 0018 */  0x79, 0x00                                       // y.
        })
        Name (CRSD, Buffer (0x0E)
        {
            /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD4, 0xFE,  // ........
            /* 0008 */  0x00, 0x50, 0x00, 0x00, 0x79, 0x00               // .P..y.
        })
        Name (CRSI, Buffer (0x0E)
        {
            /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD4, 0xFE,  // ........
            /* 0008 */  0x00, 0x50, 0x00, 0x00, 0x79, 0x00               // .P..y.
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If ((AMDT == One))
            {
                CreateDWordField (CRST, 0x04, MTFB)
                CreateDWordField (CRST, 0x08, LTFB)
                MTFB = TPMB /* \TPMB */
                LTFB = 0x1000
                CreateDWordField (CRST, 0x10, MTFC)
                CreateDWordField (CRST, 0x14, LTFC)
                MTFC = TPMC /* \TPMC */
                LTFC = 0x1000
                Return (CRST) /* \_SB_.TPM_.CRST */
            }
            Else
            {
                If ((DTPT == One))
                {
                    CreateDWordField (CRSD, 0x04, MTFE)
                    CreateDWordField (CRSD, 0x08, LTFE)
                    MTFE = 0xFED40000
                    LTFE = 0x5000
                    Return (CRSD) /* \_SB_.TPM_.CRSD */
                }
                ElseIf ((TTPF == One))
                {
                    CreateDWordField (CRSI, 0x04, MTFD)
                    CreateDWordField (CRSI, 0x08, LTFD)
                    MTFD = 0xFED40000
                    LTFD = 0x5000
                    Return (CRSI) /* \_SB_.TPM_.CRSI */
                }
                ElseIf ((TTPF == Zero))
                {
                    CreateDWordField (CRSI, 0x04, MTFF)
                    MTFF = TPMM /* \TPMM */
                    Return (CRSI) /* \_SB_.TPM_.CRSI */
                }

                MTFE = Zero
                LTFE = Zero
                Return (CRSI) /* \_SB_.TPM_.CRSI */
            }

            Return (CRSI) /* \_SB_.TPM_.CRSI */
        }

        OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x5000)
        Field (TMMB, ByteAcc, Lock, Preserve)
        {
            Offset (0x04), 
            LCST,   32, 
            Offset (0x40), 
            CREQ,   32, 
            CSTS,   32, 
            Offset (0x4C), 
            SCMD,   32
        }

        OperationRegion (CRBD, SystemMemory, TPMM, 0x48)
        Field (CRBD, AnyAcc, NoLock, Preserve)
        {
            Offset (0x04), 
            HERR,   32, 
            Offset (0x40), 
            HCMD,   32, 
            HSTS,   32
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((TTDP == Zero))
            {
                If (TPMF)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
            ElseIf ((TTDP == One))
            {
                If (TPMF)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Return (Zero)
        }

        Method (STRT, 3, Serialized)
        {
            OperationRegion (TPMR, SystemMemory, FTPM, 0x1000)
            Field (TPMR, AnyAcc, NoLock, Preserve)
            {
                Offset (0x04), 
                FERR,   32, 
                Offset (0x0C), 
                BEGN,   32
            }

            Name (TIMR, Zero)
            If ((ToInteger (Arg0) != Zero)){}
            Switch (ToInteger (Arg1))
            {
                Case (Zero)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
                Case (One)
                {
                    TIMR = Zero
                    If ((AMDT == One))
                    {
                        While (((BEGN == One) && (TIMR < 0x0200)))
                        {
                            If ((BEGN == One))
                            {
                                Sleep (One)
                                TIMR++
                            }
                        }
                    }
                    ElseIf ((((HSTS & 0x02) | (HSTS & One)
                        ) == 0x03))
                    {
                        HCMD = One
                    }
                    Else
                    {
                        FERR = One
                        BEGN = Zero
                    }

                    Return (Zero)
                }

            }

            Return (One)
        }

        Method (CRYF, 3, Serialized)
        {
            If ((ToInteger (Arg0) != One)){}
            Switch (ToInteger (Arg1))
            {
                Case (Zero)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }
                Case (One)
                {
                    Name (TPMV, Package (0x02)
                    {
                        One, 
                        Package (0x02)
                        {
                            One, 
                            0x20
                        }
                    })
                    If ((_STA () == Zero))
                    {
                        Return (Package (0x01)
                        {
                            Zero
                        })
                    }

                    Return (TPMV) /* \_SB_.TPM_.CRYF.TPMV */
                }

            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }

    Scope (_SB.TPM)
    {
        OperationRegion (TSMI, SystemIO, SMIA, 0x02)
        Field (TSMI, WordAcc, NoLock, Preserve)
        {
            SMI,    16
        }

        OperationRegion (ATNV, SystemMemory, PPIM, PPIL)
        Field (ATNV, AnyAcc, NoLock, Preserve)
        {
            RQST,   32, 
            RCNT,   32, 
            ERRO,   32, 
            FLAG,   32, 
            MISC,   32, 
            OPTN,   32, 
            SRSP,   32
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
            {
                Switch (ToInteger (Arg2))
                {
                    Case (Zero)
                    {
                        Return (Buffer (0x02)
                        {
                             0xFF, 0x01                                       // ..
                        })
                    }
                    Case (One)
                    {
                        If ((PPIV == Zero))
                        {
                            Return ("1.2")
                        }
                        Else
                        {
                            Return ("1.3")
                        }
                    }
                    Case (0x02)
                    {
                        RQST = DerefOf (Arg3 [Zero])
                        SRSP = Zero
                        FLAG = 0x02
                        TMF1 = OFST /* \OFST */
                        SRSP = Zero
                        SMI = TMF1 /* \TMF1 */
                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }
                    Case (0x03)
                    {
                        Name (PPI1, Package (0x02)
                        {
                            Zero, 
                            Zero
                        })
                        PPI1 [One] = RQST /* \_SB_.TPM_.RQST */
                        Return (PPI1) /* \_SB_.TPM_._DSM.PPI1 */
                    }
                    Case (0x04)
                    {
                        Return (TRST) /* \TRST */
                    }
                    Case (0x05)
                    {
                        Name (PPI2, Package (0x03)
                        {
                            Zero, 
                            Zero, 
                            Zero
                        })
                        SRSP = Zero
                        FLAG = 0x05
                        SMI = OFST /* \OFST */
                        PPI2 [One] = RCNT /* \_SB_.TPM_.RCNT */
                        PPI2 [0x02] = ERRO /* \_SB_.TPM_.ERRO */
                        Return (PPI2) /* \_SB_.TPM_._DSM.PPI2 */
                    }
                    Case (0x06)
                    {
                        Return (0x03)
                    }
                    Case (0x07)
                    {
                        RQST = DerefOf (Arg3 [Zero])
                        FLAG = 0x07
                        OPTN = Zero
                        If ((RQST == 0x17))
                        {
                            ToInteger (DerefOf (Arg3 [One]), OPTN) /* \_SB_.TPM_.OPTN */
                        }

                        TMF1 = OFST /* \OFST */
                        SRSP = Zero
                        SMI = TMF1 /* \TMF1 */
                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }
                    Case (0x08)
                    {
                        RQST = DerefOf (Arg3 [Zero])
                        FLAG = 0x08
                        TMF1 = OFST /* \OFST */
                        SRSP = Zero
                        SMI = TMF1 /* \TMF1 */
                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }
                    Default
                    {
                    }

                }
            }
            ElseIf ((Arg0 == ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d") /* TPM Memory Clear */))
            {
                Switch (ToInteger (Arg2))
                {
                    Case (Zero)
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }
                    Case (One)
                    {
                        RQST = DerefOf (Arg3 [Zero])
                        FLAG = 0x09
                        TMF1 = OFST /* \OFST */
                        SRSP = Zero
                        SMI = TMF1 /* \TMF1 */
                        Return (SRSP) /* \_SB_.TPM_.SRSP */
                    }
                    Default
                    {
                    }

                }
            }

            If ((Arg0 == ToUUID ("cf8e16a5-c1e8-4e25-b712-4f54a96702c8") /* TPM Hardware Information */))
            {
                Return (CRYF (Arg1, Arg2, Arg3))
            }

            If ((Arg0 == ToUUID ("6bbf6cab-5463-4714-b7cd-f0203c0368d4") /* TPM Start Method */))
            {
                Return (STRT (Arg1, Arg2, Arg3))
            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }

        Method (TPTS, 1, Serialized)
        {
            Switch (ToInteger (Arg0))
            {
                Case (0x04)
                {
                    RQST = Zero
                    FLAG = 0x09
                    SRSP = Zero
                    SMI = OFST /* \OFST */
                }
                Case (0x05)
                {
                    RQST = Zero
                    FLAG = 0x09
                    SRSP = Zero
                    SMI = OFST /* \OFST */
                }

            }
        }
    }

    Scope (_SB)
    {
        Device (CAI)
        {
            Name (_HID, EisaId ("PNPC000"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((OSYS < 0x07DC))
                {
                    Return (Zero)
                }

                If (((OSYS >= 0x07DD) && (HEFE == One)))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Device (FWHD)
        {
            Name (_HID, EisaId ("INT0800") /* Intel 82802 Firmware Hub Device */)  // _HID: Hardware ID
            Name (_CRS, Buffer (0x0E)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,  // ........
                /* 0008 */  0x00, 0x00, 0x00, 0x01, 0x79, 0x00               // ....y.
            })
        }

        Device (HPET)
        {
            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (BUF0, Buffer (0x0E)
            {
                /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD0, 0xFE,  // ........
                /* 0008 */  0x00, 0x04, 0x00, 0x00, 0x79, 0x00               // ....y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HPTE)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                If (HPTE)
                {
                    CreateDWordField (BUF0, 0x04, HPT0)
                    HPT0 = HPTB /* \HPTB */
                }

                Return (BUF0) /* \_SB_.PCI0.LPCB.HPET.BUF0 */
            }
        }

        Device (IPIC)
        {
            Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
            Name (_CRS, Buffer (0x8D)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x20, 0x00, 0x20, 0x00, 0x01, 0x02,  // G. . ...
                /* 0008 */  0x47, 0x01, 0x24, 0x00, 0x24, 0x00, 0x01, 0x02,  // G.$.$...
                /* 0010 */  0x47, 0x01, 0x28, 0x00, 0x28, 0x00, 0x01, 0x02,  // G.(.(...
                /* 0018 */  0x47, 0x01, 0x2C, 0x00, 0x2C, 0x00, 0x01, 0x02,  // G.,.,...
                /* 0020 */  0x47, 0x01, 0x30, 0x00, 0x30, 0x00, 0x01, 0x02,  // G.0.0...
                /* 0028 */  0x47, 0x01, 0x34, 0x00, 0x34, 0x00, 0x01, 0x02,  // G.4.4...
                /* 0030 */  0x47, 0x01, 0x38, 0x00, 0x38, 0x00, 0x01, 0x02,  // G.8.8...
                /* 0038 */  0x47, 0x01, 0x3C, 0x00, 0x3C, 0x00, 0x01, 0x02,  // G.<.<...
                /* 0040 */  0x47, 0x01, 0xA0, 0x00, 0xA0, 0x00, 0x01, 0x02,  // G.......
                /* 0048 */  0x47, 0x01, 0xA4, 0x00, 0xA4, 0x00, 0x01, 0x02,  // G.......
                /* 0050 */  0x47, 0x01, 0xA8, 0x00, 0xA8, 0x00, 0x01, 0x02,  // G.......
                /* 0058 */  0x47, 0x01, 0xAC, 0x00, 0xAC, 0x00, 0x01, 0x02,  // G.......
                /* 0060 */  0x47, 0x01, 0xB0, 0x00, 0xB0, 0x00, 0x01, 0x02,  // G.......
                /* 0068 */  0x47, 0x01, 0xB4, 0x00, 0xB4, 0x00, 0x01, 0x02,  // G.......
                /* 0070 */  0x47, 0x01, 0xB8, 0x00, 0xB8, 0x00, 0x01, 0x02,  // G.......
                /* 0078 */  0x47, 0x01, 0xBC, 0x00, 0xBC, 0x00, 0x01, 0x02,  // G.......
                /* 0080 */  0x47, 0x01, 0xD0, 0x04, 0xD0, 0x04, 0x01, 0x02,  // G.......
                /* 0088 */  0x22, 0x04, 0x00, 0x79, 0x00                     // "..y.
            })
        }

        Device (MATH)
        {
            Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
            Name (_CRS, Buffer (0x0D)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0xF0, 0x00, 0xF0, 0x00, 0x01, 0x01,  // G.......
                /* 0008 */  0x22, 0x00, 0x20, 0x79, 0x00                     // ". y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PCHV () == SPTH))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (LDRC)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, Buffer (0x9A)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x2E, 0x00, 0x2E, 0x00, 0x01, 0x02,  // G.......
                /* 0008 */  0x47, 0x01, 0x4E, 0x00, 0x4E, 0x00, 0x01, 0x02,  // G.N.N...
                /* 0010 */  0x47, 0x01, 0x61, 0x00, 0x61, 0x00, 0x01, 0x01,  // G.a.a...
                /* 0018 */  0x47, 0x01, 0x63, 0x00, 0x63, 0x00, 0x01, 0x01,  // G.c.c...
                /* 0020 */  0x47, 0x01, 0x65, 0x00, 0x65, 0x00, 0x01, 0x01,  // G.e.e...
                /* 0028 */  0x47, 0x01, 0x67, 0x00, 0x67, 0x00, 0x01, 0x01,  // G.g.g...
                /* 0030 */  0x47, 0x01, 0x68, 0x00, 0x68, 0x00, 0x01, 0x01,  // G.h.h...
                /* 0038 */  0x47, 0x01, 0x6C, 0x00, 0x6C, 0x00, 0x01, 0x01,  // G.l.l...
                /* 0040 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x01,  // G.p.p...
                /* 0048 */  0x47, 0x01, 0x80, 0x00, 0x80, 0x00, 0x01, 0x01,  // G.......
                /* 0050 */  0x47, 0x01, 0x92, 0x00, 0x92, 0x00, 0x01, 0x01,  // G.......
                /* 0058 */  0x47, 0x01, 0xB2, 0x00, 0xB2, 0x00, 0x01, 0x02,  // G.......
                /* 0060 */  0x47, 0x01, 0x80, 0x06, 0x80, 0x06, 0x01, 0x20,  // G...... 
                /* 0068 */  0x47, 0x01, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01,  // G.......
                /* 0070 */  0x47, 0x01, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01,  // G.......
                /* 0078 */  0x47, 0x01, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01,  // G.......
                /* 0080 */  0x47, 0x01, 0x00, 0x18, 0x00, 0x18, 0x01, 0xFF,  // G.......
                /* 0088 */  0x47, 0x01, 0x4E, 0x16, 0x4E, 0x16, 0x01, 0x02,  // G.N.N...
                /* 0090 */  0x47, 0x01, 0x22, 0x33, 0x22, 0x33, 0x01, 0x02,  // G."3"3..
                /* 0098 */  0x79, 0x00                                       // y.
            })
        }

        Device (LDR2)
        {
            Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
            Name (_UID, "LPC_DEV")  // _UID: Unique ID
            Name (_CRS, Buffer (0x0A)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x00, 0x08, 0x00, 0x08, 0x01, 0x80,  // G.......
                /* 0008 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PCHV () == SPTH))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (RTC)
        {
            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
            Name (_CRS, Buffer (0x0D)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x08,  // G.p.p...
                /* 0008 */  0x22, 0x00, 0x01, 0x79, 0x00                     // "..y.
            })
        }

        Device (TIMR)
        {
            Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
            Name (_CRS, Buffer (0x15)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x40, 0x00, 0x40, 0x00, 0x01, 0x04,  // G.@.@...
                /* 0008 */  0x47, 0x01, 0x50, 0x00, 0x50, 0x00, 0x10, 0x04,  // G.P.P...
                /* 0010 */  0x22, 0x01, 0x00, 0x79, 0x00                     // "..y.
            })
        }

        Device (CWDT)
        {
            Name (_HID, EisaId ("INT3F0D") /* ACPI Motherboard Resources */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _CID: Compatible ID
            Name (BUF0, Buffer (0x0A)
            {
                /* 0000 */  0x47, 0x01, 0x54, 0x18, 0x54, 0x18, 0x04, 0x04,  // G.T.T...
                /* 0008 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Return (BUF0) /* \_SB_.PCI0.LPCB.CWDT.BUF0 */
            }
        }
    }

    Scope (_SB)
    {
        Method (PKG2, 2, Serialized)
        {
            Name (PKG, Package (0x02)
            {
                Zero, 
                Zero
            })
            PKG [Zero] = Arg0
            PKG [One] = Arg1
            Return (PKG) /* \_SB_.PKG2.PKG_ */
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (PKG2 (GGPE (0x01060006), 0x03))
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (PKG2 (GGPE (0x01060006), 0x03))
            }
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Name (LIDF, Zero)
            Name (WMIF, Zero)
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (WMIF)
                {
                    WMIF = Zero
                    Return (Zero)
                }
                ElseIf (^^PCI0.LPCB.EC.ECOK)
                {
                    Return (^^PCI0.LPCB.EC.LSTE) /* \_SB_.PCI0.LPCB.EC__.LSTE */
                }
                Else
                {
                    Return (One)
                }
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (PKG2 (GGPE (0x01060006), 0x03))
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                If ((PSF0 & 0x40))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.LWKE = Arg0
                    }
                }
            }
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB, 
            })
            Name (ACFG, One)
            Name (IGNR, Zero)
            Name (RPPC, Zero)
            Name (RQTM, Zero)
            Name (CTMS, 0xA55A)
            Name (GPSF, Zero)
            Name (PSSN, Zero)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                IGNR = Zero
                RPPC = Zero
                RQTM = Zero
                CTMS = 0xA55A
                PSSN = Zero
            }

            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                If ((^^WMI.HKDR == Zero))
                {
                    If ((\_TZ.TZ0.PPFG || (^^PCI0.LPCB.EC.B15C || GPSF))){}
                    ElseIf ((PSF1 & 0x30))
                    {
                        ADJP (Zero)
                    }
                }

                Return (ACFG) /* \_SB_.AC__.ACFG */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (ADJP, 1, Serialized)
            {
                If (IGNR)
                {
                    Return (Zero)
                }

                Local5 = Arg0
                Local4 = Zero
                If ((\_TZ.TZ0.PPFG && ((Local5 & 0x80000000) == Zero)))
                {
                    Local7 = 0x02
                }
                ElseIf (^^PCI0.LPCB.EC.B15C)
                {
                    Local7 = 0x02
                }
                ElseIf (^^PCI0.LPCB.EC.SLFG)
                {
                    Local7 = One
                }
                Else
                {
                    Switch ((PSF1 & 0x30))
                    {
                        Case (Zero)
                        {
                            Local7 = Zero
                        }
                        Case (0x10)
                        {
                            Local7 = One
                        }
                        Case (0x20)
                        {
                            If (ACFG)
                            {
                                Local7 = Zero
                            }
                            Else
                            {
                                Local7 = One
                            }
                        }
                        Default
                        {
                            Local7 = Zero
                        }

                    }
                }

                If (^^PCI0.LPCB.EC.ECTB)
                {
                    Local4 = One
                }
                Else
                {
                }

                If ((\_PR.CFGD & One))
                {
                    If (((PSSN & 0xFFFF0000) == 0x80000000))
                    {
                        Local2 = (PSSN & 0xFFFF)
                    }
                    Else
                    {
                        Local6 = \_PR.PR00._PSS ()
                        Local2 = SizeOf (Local6)
                        PSSN = (0x80000000 | Local2)
                    }

                    Local6 = Local2
                    Switch (ToInteger (Local7))
                    {
                        Case (Zero)
                        {
                            Local0 = Zero
                        }
                        Case (One)
                        {
                            If ((Local2 > 0x02))
                            {
                                If ((\_PR.CFGD & 0x0100))
                                {
                                    Local2--
                                }

                                If ((Local2 > 0x02))
                                {
                                    Local3 = Local2
                                    Local0 = (Local2 >> One)
                                    Local0++
                                    Local3--
                                    If ((Local3 == Local0))
                                    {
                                        Local0--
                                    }

                                    If ((\_PR.CFGD & 0x0100))
                                    {
                                        Local0++
                                    }
                                }
                                Else
                                {
                                    Local0 = Local2
                                }
                            }
                            ElseIf (Local2)
                            {
                                Local2--
                                Local0 = Local2
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                        }
                        Case (0x02)
                        {
                            Local2--
                            Local0 = Local2
                        }
                        Default
                        {
                            Local0 = Zero
                        }

                    }
                }

                If ((\_PR.CFGD & One))
                {
                    If ((Local5 & 0x60000000))
                    {
                        Local1 = (Local5 & 0xFFFF)
                        If (((Local1 >= Local0) && (Local1 < Local6)))
                        {
                            Local0 = Local1
                        }

                        If ((Local5 & 0x40000000))
                        {
                            RPPC = (Local1 | 0x80000000)
                        }
                    }
                    ElseIf ((RPPC & 0x80000000))
                    {
                        Local1 = (RPPC & 0xFFFF)
                        If (((Local1 >= Local0) && (Local1 < Local6)))
                        {
                            Local0 = Local1
                        }
                    }

                    If ((Local0 != \_PR.CPPC))
                    {
                        \_PR.CPPC = Local0
                        GPEC = One
                    }

                    If (\_PR.PR00._PPC ())
                    {
                        Local1 = One
                    }
                    Else
                    {
                        Local1 = Zero
                    }

                    If ((RQTM & 0x80000000))
                    {
                        Local1 |= (RQTM & 0x03)
                    }

                    If ((Local5 & 0x18000000))
                    {
                        Local1 |= (Local5 & 0x03)
                        If ((Local5 & 0x10000000))
                        {
                            RQTM = ((Local5 & 0x03) | 0x80000000)
                        }
                    }

                    If (Local4)
                    {
                        Local1 = 0x03
                    }

                    If (((\_PR.CFGD & 0x0100) == Zero))
                    {
                        Local1 &= One
                    }

                    If ((Local1 != CTMS))
                    {
                        PRM1 = Local1
                        PRM0 = 0x08
                        SSMP = 0xE0
                        CTMS = Local1
                    }
                }
                Else
                {
                    Switch (ToInteger (Local7))
                    {
                        Case (Zero)
                        {
                            Local0 = 0x03
                        }
                        Case (One)
                        {
                            Local0 = 0x02
                        }
                        Case (0x02)
                        {
                            Local0 = 0x02
                        }
                        Default
                        {
                            Local0 = 0x03
                        }

                    }

                    PRM0 = Local0
                    SSMP = 0xE0
                }

                Return (Zero)
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB, 
            })
            Name (BFCC, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    If (^^PCI0.LPCB.EC.BAT0)
                    {
                        Return (0x1F)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Name (PBIF, Package (0x0D)
            {
                One, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                One, 
                0x39D0, 
                Zero, 
                Zero, 
                0x40, 
                0x40, 
                "BAT", 
                "0001", 
                "LION", 
                "Notebook"
            })
            Method (IVBI, 0, NotSerialized)
            {
                PBIF [One] = 0xFFFFFFFF
                PBIF [0x02] = 0xFFFFFFFF
                PBIF [0x04] = 0xFFFFFFFF
                PBIF [0x09] = " "
                PBIF [0x0A] = " "
                PBIF [0x0B] = " "
                PBIF [0x0C] = " "
                BFCC = Zero
            }

            Method (UPBI, 0, NotSerialized)
            {
                If (^^PCI0.LPCB.EC.BAT0)
                {
                    Local0 = (^^PCI0.LPCB.EC.BDC0 & 0xFFFF)
                    PBIF [One] = Local0
                    Local0 = (^^PCI0.LPCB.EC.BFC0 & 0xFFFF)
                    PBIF [0x02] = Local0
                    BFCC = Local0
                    Local0 = (^^PCI0.LPCB.EC.BDV0 & 0xFFFF)
                    PBIF [0x04] = Local0
                    Local0 = (^^PCI0.LPCB.EC.BCW0 & 0xFFFF)
                    PBIF [0x05] = Local0
                    Local0 = (^^PCI0.LPCB.EC.BCL0 & 0xFFFF)
                    PBIF [0x06] = Local0
                    PBIF [0x09] = "BAT"
                    PBIF [0x0A] = "0001"
                    PBIF [0x0B] = "LION"
                    PBIF [0x0C] = "Notebook"
                }
                Else
                {
                    IVBI ()
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    UPBI ()
                }
                Else
                {
                    IVBI ()
                }

                Return (PBIF) /* \_SB_.BAT0.PBIF */
            }

            Name (PBST, Package (0x04)
            {
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x3D90
            })
            Method (IVBS, 0, NotSerialized)
            {
                PBST [Zero] = Zero
                PBST [One] = 0xFFFFFFFF
                PBST [0x02] = 0xFFFFFFFF
                PBST [0x03] = 0x2710
            }

            Method (UPBS, 0, NotSerialized)
            {
                If (^^PCI0.LPCB.EC.BAT0)
                {
                    Local0 = Zero
                    Local1 = Zero
                    If (^^AC.ACFG)
                    {
                        If (((^^PCI0.LPCB.EC.BST0 & 0x02) == 0x02))
                        {
                            Local0 |= 0x02
                            Local1 = (^^PCI0.LPCB.EC.BPR0 & 0xFFFF)
                        }
                    }
                    Else
                    {
                        Local0 |= One
                        Local1 = (^^PCI0.LPCB.EC.BPR0 & 0xFFFF)
                    }

                    Local7 = (Local1 & 0x8000)
                    If ((Local7 == 0x8000))
                    {
                        Local1 ^= 0xFFFF
                    }

                    Local2 = (^^PCI0.LPCB.EC.BRC0 & 0xFFFF)
                    Local3 = (^^PCI0.LPCB.EC.BPV0 & 0xFFFF)
                    PBST [Zero] = Local0
                    PBST [One] = Local1
                    PBST [0x02] = Local2
                    PBST [0x03] = Local3
                    If ((BFCC != ^^PCI0.LPCB.EC.BFC0))
                    {
                        Notify (BAT0, 0x81) // Information Change
                    }
                }
                Else
                {
                    IVBS ()
                }
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    UPBS ()
                }
                Else
                {
                    IVBS ()
                }

                Return (PBST) /* \_SB_.BAT0.PBST */
            }
        }

        Device (WMI)
        {
            Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (INDX, Zero)
            Name (WM23, Zero)
            Name (_WDG, Buffer (0x3C)
            {
                /* 0000 */  0x6D, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1, 0x11,  // m.......
                /* 0008 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00, 0x00,  // ....)...
                /* 0010 */  0x42, 0x42, 0x01, 0x02, 0x6B, 0x0F, 0xBC, 0xAB,  // BB..k...
                /* 0018 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9, 0x06,  // ........
                /* 0020 */  0x29, 0x10, 0x00, 0x00, 0xD0, 0x00, 0x01, 0x08,  // ).......
                /* 0028 */  0x6C, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1, 0x11,  // l.......
                /* 0030 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00, 0x00,  // ....)...
                /* 0038 */  0xD1, 0x00, 0x01, 0x08                           // ....
            })
            Name (EVNT, Zero)
            Name (EVID, Zero)
            Name (HKDR, Zero)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                HKDR = Zero
            }

            Method (GCMD, 3, Serialized)
            {
                Name (ARGS, Zero)
                If (SizeOf (Arg2))
                {
                    ARGS = Arg2
                }

                Local0 = Zero
                If ((ToInteger (Arg1) == One))
                {
                    If (HKDR)
                    {
                        Local0 = EVNT /* \_SB_.WMI_.EVNT */
                        If ((^^PCI0.LPCB.EC.ESCF == One))
                        {
                            If ((^^PCI0.LPCB.EC.FBUF == 0xAA))
                            {
                                Local0 = 0x64
                            }
                            ElseIf ((^^PCI0.LPCB.EC.FBUF == Zero))
                            {
                                Local0 = 0x65
                            }

                            ^^PCI0.LPCB.EC.FBUF = 0xFF
                            ^^PCI0.LPCB.EC.ESCF = Zero
                        }
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x05))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            If ((^^PCI0.LPCB.EC.OEM3 & 0x08))
                            {
                                If ((Local1 & 0x02))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }

                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x06))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            If ((^^PCI0.LPCB.EC.OEM3 & 0x04))
                            {
                                If ((Local1 & One))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }

                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x07))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            If ((^^PCI0.LPCB.EC.OEM3 & 0x10))
                            {
                                If ((Local1 & 0x04))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }

                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x08))
                {
                    Local0 = GHPI ()
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x09))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            If ((Local1 & 0x10))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }

                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x0A))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            If ((^^PCI0.LPCB.EC.OEM3 & 0x20))
                            {
                                If ((Local1 & 0x08))
                                {
                                    Local0 = One
                                }
                                Else
                                {
                                    Local0 = Zero
                                }
                            }
                            Else
                            {
                                Local0 = 0x02
                            }

                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x10))
                {
                    If (^^PCI0.LPCB.EC.SLFG)
                    {
                        Local0 |= One
                    }

                    If (\_TZ.TZ0.PPFG)
                    {
                        Local0 |= 0x02
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x11))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            If ((Local1 & 0x40))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }

                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x12))
                {
                    Name (PFBF, Buffer (0x0100)
                    {
                         0x00                                             // .
                    })
                    If (PFBA)
                    {
                        OperationRegion (PFMM, SystemMemory, PFBA, 0x0100)
                        Field (PFMM, ByteAcc, NoLock, Preserve)
                        {
                            PFDB,   2048
                        }

                        PFBF = PFDB /* \_SB_.WMI_.GCMD.PFDB */
                    }

                    Return (PFBF) /* \_SB_.WMI_.GCMD.PFBF */
                }

                If ((ToInteger (Arg1) == 0x32))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Local0 = ^^PCI0.LPCB.EC.BDC0 /* \_SB_.PCI0.LPCB.EC__.BDC0 */
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x33))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x34))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x38))
                {
                    Local0 = One
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x39))
                {
                    Return (^^PCI0.TMSS.GTMP ())
                }

                If ((ToInteger (Arg1) == 0x3B))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x06
                        ^^PCI0.LPCB.EC.FBUF = One
                        ^^PCI0.LPCB.EC.FBF1 = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xB1
                        Local0 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                        Local0 = ((Local0 << 0x08) | ^^PCI0.LPCB.EC.FBUF) /* \_SB_.PCI0.LPCB.EC__.FBUF */
                        Local0 = ((Local0 << 0x08) | ^^PCI0.LPCB.EC.FDAT) /* \_SB_.PCI0.LPCB.EC__.FDAT */
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x3C))
                {
                    If (((PSF0 & 0x10) == Zero))
                    {
                        If (^^PCI0.GFX0.PDDS (0x0300))
                        {
                            Local0 = One
                        }
                        Else
                        {
                            Local0 = Zero
                        }
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x3D))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xCA
                        Local0 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                        ^^PCI0.LPCB.EC.FCMD = Zero
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x3E))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0xA2
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                        Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                        If ((Local1 & 0x7E))
                        {
                            Local0 = One
                        }
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x3F))
                {
                    If ((MOLF == One))
                    {
                        Local0 = 0x01000005
                    }
                    Else
                    {
                        Local0 = Zero
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x40))
                {
                    Local0 = 0x000F1700
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x41))
                {
                    ^^PCI0.LPCB.EC.FDAT = ((ARGS >> 0x18) & 0xFF)
                    ^^PCI0.LPCB.EC.FBUF = ((ARGS >> 0x10) & 0xFF)
                    ^^PCI0.LPCB.EC.FBF1 = ((ARGS >> 0x08) & 0xFF)
                    ^^PCI0.LPCB.EC.FCMD = (ARGS & 0xFF)
                    Local0 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                    Local0 |= (^^PCI0.LPCB.EC.FBUF << 0x08)
                    Local0 |= (^^PCI0.LPCB.EC.FBF1 << 0x10)
                    Local0 |= (^^PCI0.LPCB.EC.FBF2 << 0x18)
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x42))
                {
                    Local0 = BKST /* \BKST */
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x43))
                {
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x45))
                {
                    If (ISI7)
                    {
                        If ((MOLF == One))
                        {
                            Local0 = 0x050A050A
                        }
                        Else
                        {
                            Local0 = 0x05080508
                        }
                    }
                    Else
                    {
                        Local0 = 0x05050505
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x51))
                {
                    Noop
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x52))
                {
                    Return (PSF1) /* \PSF1 */
                }

                If ((ToInteger (Arg1) == 0x62))
                {
                    Return (Zero)
                }

                If ((ToInteger (Arg1) == 0x63))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FBF2 /* \_SB_.PCI0.LPCB.EC__.FBF2 */
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }

                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            Local0 = ^^PCI0.LPCB.EC.FBF2 /* \_SB_.PCI0.LPCB.EC__.FBF2 */
                            Local0 = ((Local0 << 0x08) | Local1)
                            Local0 = ((Local0 << 0x08) | Local2)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x64))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = Zero
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local0 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            Local2 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            Local3 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                            Local0 = ((Local0 << 0x08) | Local2)
                            Local0 = ((Local0 << 0x08) | Local3)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x6D))
                {
                    If (((OSYS >= 0x07DD) && (HEFE == One)))
                    {
                        ^^HIDD.HPEM (0x08)
                    }
                }

                If ((ToInteger (Arg1) == 0x6E))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local0 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            Local2 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            Local3 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                            Local0 = ((Local0 << 0x08) | Local2)
                            Local0 = ((Local0 << 0x08) | Local3)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x6F))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            Local0 = ^^PCI0.LPCB.EC.FBF2 /* \_SB_.PCI0.LPCB.EC__.FBF2 */
                            Local0 |= (Local0 << 0x08)
                            Local0 = ((Local0 << 0x08) | Local1)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x70))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            Local0 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                            Local0 |= (Local1 << 0x08)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }

                        ^^PCI0.LPCB.EC.FDAT = 0x04
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            Local1 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            Local1 |= (Local2 << 0x08)
                            Local0 |= (Local1 << 0x10)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x71))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x05
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            Local0 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            Local0 |= (Local1 << 0x08)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }

                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            Local2 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            Local1 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                            Local1 |= (Local2 << 0x08)
                            Local0 |= (Local1 << 0x10)
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x73))
                {
                    Local1 = (INDX & 0xFFFF)
                    Local2 = ((INDX >> 0x10) & 0xFFFF)
                    If ((Local2 > 0x02))
                    {
                        Local2 = Zero
                    }

                    If ((Local1 > 0xFF))
                    {
                        Return (Zero)
                    }

                    Local2 = (One << Local2)
                    Local3 = Local2
                    Local3--
                    If (((Local1 + Local3) > 0xFF))
                    {
                        Return (Zero)
                    }

                    Local0 = (Local1 + 0xFF700100)
                    Name (RBUF, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                           // ....
                    })
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        OperationRegion (RH2M, SystemMemory, Local0, Local2)
                        Switch (ToInteger (Local2))
                        {
                            Case (One)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMB,   8
                                }

                                RBUF = RHMB /* \_SB_.WMI_.GCMD.RHMB */
                            }
                            Case (0x02)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMW,   16
                                }

                                RBUF = RHMW /* \_SB_.WMI_.GCMD.RHMW */
                            }
                            Case (0x04)
                            {
                                Field (RH2M, ByteAcc, Lock, Preserve)
                                {
                                    RHMD,   32
                                }

                                RBUF = RHMD /* \_SB_.WMI_.GCMD.RHMD */
                            }

                        }
                    }

                    Return (RBUF) /* \_SB_.WMI_.GCMD.RBUF */
                }

                If ((ToInteger (Arg1) == 0x77))
                {
                    Local0 = (BAEE >> One)
                    Local0 |= (BSCP << 0x08)
                    Local0 |= (BTCP << 0x10)
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x7A))
                {
                    Local0 = (PSF2 & 0xFFFFFFFFFFFFFBFF)
                    If (PSTG ())
                    {
                        Local0 |= 0x0400
                    }

                    If ((\_PR.CFGD & 0x00400000))
                    {
                        Local0 |= 0x40000000
                    }

                    Return (Local0)
                }

                Return (Ones)
            }

            Method (GHPI, 0, NotSerialized)
            {
                If (^^PCI0.LPCB.EC.ECOK)
                {
                    ^^PCI0.LPCB.EC.FDAT = 0x71
                    ^^PCI0.LPCB.EC.FCMD = 0xD2
                    Local0 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                }
                Else
                {
                    Local0 = Ones
                }

                Return (Local0)
            }

            Method (SCMD, 3, Serialized)
            {
                Name (ARGS, Zero)
                If (SizeOf (Arg2))
                {
                    ARGS = Arg2
                }

                Local0 = Zero
                If ((ToInteger (Arg1) == 0x13))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            ^^PCI0.LPCB.EC.ECKS |= 0x80
                        }
                        Else
                        {
                            ^^PCI0.LPCB.EC.ECKS &= 0x7F
                        }
                    }

                    Local0 = 0x13
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x14))
                {
                    Local0 = 0x14
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x1D))
                {
                    Local0 = 0x1D
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x1F))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            ^^PCI0.LPCB.EC.FDAT = One
                            P80H = 0xDF
                        }
                        Else
                        {
                            ^^PCI0.LPCB.EC.FDAT = Zero
                            P80H = 0x5F
                        }

                        ^^PCI0.LPCB.EC.FCMD = 0xA4
                    }

                    Local0 = 0x1F
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x20))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            Local1 = 0xC2
                        }
                        Else
                        {
                            Local1 = 0xC3
                        }

                        ^^PCI0.LPCB.EC.FDAT = Local1
                        ^^PCI0.LPCB.EC.FBUF = 0xA2
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                    }

                    Local0 = 0x20
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x21))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            Local1 = 0xC2
                        }
                        Else
                        {
                            Local1 = 0xC3
                        }

                        ^^PCI0.LPCB.EC.FDAT = Local1
                        ^^PCI0.LPCB.EC.FBUF = 0xA3
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                    }

                    Local0 = 0x21
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x22))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            Local1 = 0xC2
                        }
                        Else
                        {
                            Local1 = 0xC3
                        }

                        ^^PCI0.LPCB.EC.FDAT = Local1
                        ^^PCI0.LPCB.EC.FBUF = 0xA1
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                    }

                    Local0 = 0x22
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x26))
                {
                    Local0 = 0x26
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x27))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = Zero
                        ^^PCI0.LPCB.EC.FBUF = ToInteger (ARGS)
                        ^^PCI0.LPCB.EC.FCMD = 0xCA
                    }

                    Local0 = 0x27
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x2A))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            Local1 = 0xC2
                        }
                        Else
                        {
                            Local1 = 0xC3
                        }

                        ^^PCI0.LPCB.EC.FDAT = Local1
                        ^^PCI0.LPCB.EC.FBUF = 0xA5
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                    }

                    Local0 = 0x2A
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x2C))
                {
                    Local0 = 0x2C
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x31))
                {
                    CreateField (Arg2, Zero, One, KMUT)
                    CreateField (Arg2, One, 0x07, KAUD)
                    If (^^PCI0.LPCB.EC.ECOK){}
                    Local0 = 0x31
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x46))
                {
                    HKDR = One
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If ((LKFG & One))
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x05
                            ^^PCI0.LPCB.EC.FBUF = One
                            ^^PCI0.LPCB.EC.FCMD = 0xC4
                        }
                    }

                    Return (PSF3) /* \PSF3 */
                }

                If ((ToInteger (Arg1) == 0x47))
                {
                    Local0 = 0x47
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x48))
                {
                    ^^AC.IGNR = One
                    Local0 = 0x48
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x49))
                {
                    Notify (PWRB, 0x80) // Status Change
                    Local0 = 0x49
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x4A))
                {
                    Local0 = 0x4A
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x4C))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            Local1 = 0xC2
                        }
                        Else
                        {
                            Local1 = 0xC3
                        }

                        ^^PCI0.LPCB.EC.FDAT = Local1
                        ^^PCI0.LPCB.EC.FBUF = 0xA4
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                    }

                    Local0 = 0x4C
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x4E))
                {
                    Local0 = 0x4E
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x4F))
                {
                    Switch (ToInteger (ARGS))
                    {
                        Case (Zero)
                        {
                            P80H = 0x4F
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                PSF1 &= 0xFFFFFFFFFFFFFFCF
                                ^^AC.ADJP (Zero)
                            }
                        }
                        Case (One)
                        {
                            P80H = 0x5F
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x10)
                                ^^AC.ADJP (Zero)
                            }
                        }
                        Case (0x02)
                        {
                            P80H = 0x6F
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x20)
                                ^^AC.ADJP (Zero)
                            }
                        }

                    }

                    If ((NVBB & 0xFFFF))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (^^AC.ACFG)
                            {
                                Local5 = Zero
                                Local6 = One
                            }
                            Else
                            {
                                Local5 = ^^PCI0.LPCB.EC.BBST /* \_SB_.PCI0.LPCB.EC__.BBST */
                                If ((Local5 == Zero))
                                {
                                    Local5 = (((NVBB >> 0x04) & 0xF0) | (NVBB & 
                                        0x0F))
                                    Local6 = (NVBB & 0x0F)
                                }
                                Else
                                {
                                    Local6 = (Local5 & 0x0F)
                                }
                            }

                            ^^PCI0.LPCB.EC.BBST = Local5
                            Notify (^^PCI0.PEG0.PEGP, (Local6 | 0xD0))
                        }
                    }

                    Local0 = 0x4F
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x55))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.INF2 |= 0x02
                    }

                    Local0 = 0x55
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x56))
                {
                    Local0 = 0x56
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x57))
                {
                    Local0 = 0x57
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x5A))
                {
                    Switch (ToInteger (ARGS))
                    {
                        Case (Zero)
                        {
                            ^^LID0.WMIF = One
                            Notify (LID0, 0x80) // Status Change
                        }
                        Case (One)
                        {
                            Notify (SLPB, 0x80) // Status Change
                        }
                        Case (0x02)
                        {
                            Notify (PWRB, 0x80) // Status Change
                        }

                    }

                    Local0 = 0x5A
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x5B))
                {
                    PRM1 = ARGS /* \_SB_.WMI_.SCMD.ARGS */
                    PRM0 = 0x07
                    SSMP = 0xE0
                    Local0 = 0x5B
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x5E))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            Local1 = 0xC2
                        }
                        Else
                        {
                            Local1 = 0xC3
                        }

                        ^^PCI0.LPCB.EC.FDAT = Local1
                        ^^PCI0.LPCB.EC.FBUF = 0xA6
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                    }

                    Local0 = 0x5E
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x65))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            Local1 = 0xC2
                        }
                        Else
                        {
                            Local1 = 0xC3
                        }

                        ^^PCI0.LPCB.EC.FDAT = Local1
                        ^^PCI0.LPCB.EC.FBUF = 0xA9
                        ^^PCI0.LPCB.EC.FCMD = 0xB8
                    }

                    Local0 = 0x65
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x66))
                {
                    CAMV = ((ARGS >> 0x10) & 0xFFFF)
                    CAMP = (ARGS & 0xFFFF)
                    PRM0 = 0x0B
                    SSMP = 0xE0
                }

                If ((ToInteger (Arg1) == 0x67))
                {
                    Local2 = ((ARGS >> 0x0C) & 0x0F)
                    If ((Local2 >= 0x0A))
                    {
                        Local2 = Zero
                    }
                    Else
                    {
                        Local2 *= 0x19
                        Local2 = (0xFF - Local2)
                    }

                    Local3 = ((ARGS >> 0x10) & 0xFF)
                    Local4 = ((ARGS >> 0x18) & 0x0F)
                    Local7 = ((ARGS >> 0x1C) & 0x0F)
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (((Local7 >= 0x07) && (Local7 <= 0x0B)))
                        {
                            ^^PCI0.LPCB.EC.FDAT = Local7
                            ^^PCI0.LPCB.EC.FCMD = 0xC4
                        }
                        Else
                        {
                            If ((Local7 == Zero))
                            {
                                Local0 = Zero
                                Local0 = (ARGS & 0x07)
                                Local0 |= ((ARGS >> One) & 0x38)
                                Local0 |= ((ARGS >> 0x02) & 0x01C0)
                                ^^PCI0.LPCB.EC.FDAT = Local0
                                ^^PCI0.LPCB.EC.FBUF = (Local0 >> 0x08)
                                ^^PCI0.LPCB.EC.FCMD = 0xC2
                            }

                            If ((Local7 == One))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0x03
                                ^^PCI0.LPCB.EC.FBUF = Local3
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }

                            If ((Local7 == 0x02))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0x04
                                ^^PCI0.LPCB.EC.FBUF = Local3
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }

                            If ((Local7 == 0x03))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0x06
                                ^^PCI0.LPCB.EC.FBUF = Local3
                                ^^PCI0.LPCB.EC.FBF1 = Local4
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }

                            If ((Local7 == 0x04))
                            {
                                If (Local3)
                                {
                                    Local0 = 0x0D
                                }
                                Else
                                {
                                    Local0 = 0x0E
                                }

                                ^^PCI0.LPCB.EC.FDAT = Local0
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }

                            If ((Local7 == 0x0C)){}
                            If ((Local7 == 0x0D))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0x02
                                ^^PCI0.LPCB.EC.FBUF = Local2
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }

                            If ((Local7 == 0x0E))
                            {
                                Local1 = ((ARGS >> 0x0E) & 0x1F)
                                If ((ARGS & 0x2000))
                                {
                                    Local1 |= 0x20
                                }

                                ^^PCI0.LPCB.EC.FDAT = 0x0C
                                ^^PCI0.LPCB.EC.FBUF = Local1
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }

                            If ((Local7 == 0x0F))
                            {
                                Local6 = Zero
                                Local3 = (ARGS & 0xFF)
                                Local2 = ((ARGS >> 0x08) & 0xFF)
                                Local1 = ((ARGS >> 0x10) & 0xFF)
                                If ((Local4 < 0x03))
                                {
                                    Local0 = (Local4 + 0x03)
                                    Local6 = 0xCA
                                }
                                ElseIf ((Local4 == 0x03))
                                {
                                    Local0 = 0x07
                                    Local6 = 0xCA
                                }
                                ElseIf ((Local4 == 0x04))
                                {
                                    Local0 = 0x06
                                    Local1 = (ARGS & 0xFF)
                                    Local6 = 0xCA
                                }
                                ElseIf ((Local4 == 0x06))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x09
                                    ^^PCI0.LPCB.EC.FBUF = Local1
                                    ^^PCI0.LPCB.EC.FBF1 = Local2
                                    ^^PCI0.LPCB.EC.FBF2 = Local3
                                    ^^PCI0.LPCB.EC.FCMD = 0xCA
                                    Local0 = 0x0A
                                    Local6 = 0xCA
                                }

                                If (Local6)
                                {
                                    ^^PCI0.LPCB.EC.FDAT = Local0
                                    ^^PCI0.LPCB.EC.FBUF = Local1
                                    ^^PCI0.LPCB.EC.FBF1 = Local2
                                    ^^PCI0.LPCB.EC.FBF2 = Local3
                                    ^^PCI0.LPCB.EC.FCMD = Local6
                                }
                            }
                        }
                    }

                    Local0 = 0x67
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x68))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Local4 = ARGS /* \_SB_.WMI_.SCMD.ARGS */
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FBUF = (Local4 & 0xFF)
                        ^^PCI0.LPCB.EC.FCMD = 0xC1
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x08) & 0xFF)
                        ^^PCI0.LPCB.EC.FCMD = 0xC1
                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x10) & 0xFF)
                        ^^PCI0.LPCB.EC.FCMD = 0xC1
                        ^^PCI0.LPCB.EC.FDAT = 0x04
                        ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x18) & 0xFF)
                        ^^PCI0.LPCB.EC.FCMD = 0xC1
                    }

                    Local0 = 0x68
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x69))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Local4 = ARGS /* \_SB_.WMI_.SCMD.ARGS */
                        If ((Local4 & One))
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xFF
                            ^^PCI0.LPCB.EC.FBUF = One
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                        }

                        If ((Local4 & 0x02))
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xFF
                            ^^PCI0.LPCB.EC.FBUF = 0x02
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                        }

                        If ((Local4 & 0x04))
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xFF
                            ^^PCI0.LPCB.EC.FBUF = 0x03
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                        }

                        If ((Local4 & 0x08))
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xFF
                            ^^PCI0.LPCB.EC.FBUF = 0x04
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                        }
                    }

                    Local0 = 0x69
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x6A))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Local0 = ((ARGS >> 0x08) & 0xFF)
                        Local1 = (ARGS & 0xFF)
                        ^^PCI0.LPCB.EC.FDAT = Local0
                        ^^PCI0.LPCB.EC.FBUF = Local1
                        ^^PCI0.LPCB.EC.FCMD = 0xBA
                    }

                    Local0 = 0x6A
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x6B))
                {
                    INDX = ARGS /* \_SB_.WMI_.SCMD.ARGS */
                    Local0 = 0x6B
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x6C))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ARGS)
                        {
                            ^^PCI0.LPCB.EC.AIRP |= 0x80
                        }
                        Else
                        {
                            ^^PCI0.LPCB.EC.AIRP &= 0x7F
                        }
                    }

                    Local0 = 0x6C
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x74))
                {
                    CreateField (Arg2, Zero, One, SMUT)
                    CreateField (Arg2, One, 0x07, SAUD)
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        If (ToInteger (SMUT))
                        {
                            Local0 = Zero
                        }
                        Else
                        {
                            Local0 = ToInteger (SAUD)
                            If ((Local0 > 0x64))
                            {
                                Local0 = 0x64
                            }
                        }

                        If (((LKFG & 0x0C) == 0x04)){}
                        Else
                        {
                            ^^PCI0.LPCB.EC.FDAT = Local0
                            ^^PCI0.LPCB.EC.FCMD = 0xC6
                        }
                    }

                    Local0 = 0x74
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x75))
                {
                    Local1 = (INDX & 0xFFFF)
                    Local2 = ((INDX >> 0x10) & 0xFFFF)
                    If ((Local2 > 0x02))
                    {
                        Local2 = Zero
                    }

                    If ((Local1 > 0xFF))
                    {
                        Return (Ones)
                    }

                    Local2 = (One << Local2)
                    Local3 = Local2
                    Local3--
                    If (((Local1 + Local3) > 0xFF))
                    {
                        Return (Ones)
                    }

                    Local0 = (Local1 + 0xFF700100)
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        Name (WBUF, Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        })
                        CreateByteField (WBUF, Zero, ARGB)
                        CreateWordField (WBUF, Zero, ARGW)
                        CreateDWordField (WBUF, Zero, ARGD)
                        WBUF = ARGS /* \_SB_.WMI_.SCMD.ARGS */
                        If (((Local1 <= 0xD9) && ((Local1 + Local3) >= 
                            0xD9)))
                        {
                            Local4 = (0xD9 - Local1)
                            Local6 = (DerefOf (WBUF [Local4]) & 0x40)
                            Local7 = (^^PCI0.LPCB.EC.AIRP & 0xBF)
                            WBUF [Local4] = (Local6 | Local7)
                        }

                        OperationRegion (WH2M, SystemMemory, Local0, Local2)
                        Switch (ToInteger (Local2))
                        {
                            Case (One)
                            {
                                Field (WH2M, ByteAcc, Lock, Preserve)
                                {
                                    WHMB,   8
                                }

                                WHMB = ARGB /* \_SB_.WMI_.SCMD.ARGB */
                            }
                            Case (0x02)
                            {
                                Field (WH2M, ByteAcc, Lock, Preserve)
                                {
                                    WHMW,   16
                                }

                                WHMW = ARGW /* \_SB_.WMI_.SCMD.ARGW */
                            }
                            Case (0x04)
                            {
                                Field (WH2M, ByteAcc, Lock, Preserve)
                                {
                                    WHMD,   32
                                }

                                WHMD = ARGD /* \_SB_.WMI_.SCMD.ARGD */
                            }

                        }

                        If (((Local1 <= 0xF8) && ((Local1 + Local3) >= 
                            0xF8)))
                        {
                            Local4 = (0xF8 - Local1)
                            ^^PCI0.LPCB.EC.FCMD = DerefOf (WBUF [Local4])
                        }

                        Local0 = 0x75
                    }
                    Else
                    {
                        Local0 = Ones
                    }

                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x76))
                {
                    Local1 = ((ARGS & 0xFF000000) >> 0x18)
                    Local2 = (ARGS & 0x00FFFFFF)
                    Switch (ToInteger (Local1))
                    {
                        Case (0x05)
                        {
                            BAEE = (Local2 << One)
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                ^^PCI0.LPCB.EC.FBF1 = BAEE /* \BAEE */
                                ^^PCI0.LPCB.EC.FCMD = 0xCB
                            }

                            PRM0 = 0x0C
                            SSMP = 0xE0
                        }
                        Case (0x06)
                        {
                            BTCP = ((Local2 & 0xFF00) >> 0x08)
                            BSCP = (Local2 & 0xFF)
                            If ((BSCP >= BTCP))
                            {
                                BSCP = 0x5F
                                BTCP = 0x64
                            }

                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                ^^PCI0.LPCB.EC.FBUF = BSCP /* \BSCP */
                                ^^PCI0.LPCB.EC.FDAT = BTCP /* \BTCP */
                            }
                        }

                    }

                    Local0 = 0x76
                    Return (Local0)
                }

                If ((ToInteger (Arg1) == 0x79))
                {
                    Local1 = ((ARGS & 0xFF000000) >> 0x18)
                    Local2 = (ARGS & 0x00FFFFFF)
                    Switch (ToInteger (Local1))
                    {
                        Case (One)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                If ((Local2 < 0x03))
                                {
                                    Local3 = Zero
                                    If (((Local2 == Zero) || (Local2 == 0x02)))
                                    {
                                        Local1 = 0xC3
                                        If ((Local2 == 0x02))
                                        {
                                            Local3 = One
                                        }
                                    }
                                    Else
                                    {
                                        Local1 = 0xC2
                                    }

                                    ^^PCI0.LPCB.EC.FDAT = Local1
                                    ^^PCI0.LPCB.EC.FBUF = 0xA9
                                    ^^PCI0.LPCB.EC.FCMD = 0xB8
                                    ^^PCI0.LPCB.EC.XTUF = Local3
                                }
                            }
                            Else
                            {
                                Local0 = Ones
                            }
                        }
                        Case (0x05)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                If (Local2)
                                {
                                    ^^PCI0.LPCB.EC.ECKS |= 0x10
                                }
                                Else
                                {
                                    ^^PCI0.LPCB.EC.ECKS &= 0xEF
                                }
                            }
                            Else
                            {
                                Local0 = Ones
                            }
                        }
                        Case (0x07)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                Local4 = Zero
                                Local5 = Zero
                                Local6 = Zero
                                Local7 = Zero
                                If (Local2)
                                {
                                    Local4 = (Local2 & 0xFF)
                                    Local5 = ((Local2 >> 0x08) & 0xFF)
                                    Local6 = ((Local2 >> 0x10) & 0xFF)
                                    Local3 = (((Local6 - 0x32) * 0x0A) / ((TJMX - 
                                        0x0A) - Local4))
                                    Local3 <<= 0x03
                                    Local7 = (Local3 / 0x0A)
                                    If (((Local3 - (Local7 * 0x0A)) > 0x04))
                                    {
                                        Local7++
                                    }

                                    Local3 = One
                                }
                                Else
                                {
                                    Local3 = Zero
                                }

                                ^^PCI0.LPCB.EC.FDAT = Local3
                                ^^PCI0.LPCB.EC.FBUF = Local4
                                ^^PCI0.LPCB.EC.FBF1 = Local5
                                ^^PCI0.LPCB.EC.FBF2 = Local6
                                ^^PCI0.LPCB.EC.FBF3 = Local7
                                ^^PCI0.LPCB.EC.FCMD = 0xCC
                            }
                            Else
                            {
                                Local0 = Ones
                            }
                        }
                        Case (0x09)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                PSLD (Local2)
                            }
                            Else
                            {
                                Local0 = Ones
                            }
                        }
                        Case (0x0D)
                        {
                        }
                        Case (0x0E)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                ^^PCI0.LPCB.EC.GFOF = (Local2 & 0xFF)
                            }
                            Else
                            {
                                Local0 = Ones
                            }
                        }
                        Case (0x10)
                        {
                        }
                        Case (0x13)
                        {
                            If (PFBA)
                            {
                                Local1 = (PFBA + 0x02)
                                OperationRegion (PFBU, SystemMemory, Local1, 0x02)
                                Field (PFBU, WordAcc, NoLock, Preserve)
                                {
                                    BUPD,   16
                                }

                                BUPD = (ARGS & 0xFFFF)
                                PRM0 = 0x0E
                                SSMP = 0xE0
                            }
                        }
                        Case (0x15)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local2
                                ^^PCI0.LPCB.EC.FCMD = 0xD3
                            }
                        }
                        Case (0x17)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local2
                                ^^PCI0.LPCB.EC.FCMD = 0xD5
                            }

                            If ((^^PCI0.LPCB.EC.NACT == One))
                            {
                                Local3 = Zero
                                Local4 = Zero
                                Local5 = Zero
                                Local6 = Zero
                                Local3 = (Local2 & 0x07)
                                Local4 = (Local2 & 0x10)
                                Local5 = (Local2 & 0x20)
                                Local6 = (Local2 & 0x40)
                                If ((((Local3 == 0x05) || (Local3 == 0x06)) || (Local3 == 0x07)))
                                {
                                    If ((WM23 == Zero))
                                    {
                                        WM23 = 0x07
                                        If ((HSLF == One)){}
                                        Else
                                        {
                                            ^^PCI0.LPCB.EC.ECTB = One
                                            ^^AC.ADJP (Zero)
                                        }
                                    }
                                }
                                ElseIf ((Local3 == 0x04))
                                {
                                    If ((WM23 == Zero))
                                    {
                                        WM23 = 0x04
                                        If ((HSFG == One)){}
                                        ElseIf ((MOLF == One))
                                        {
                                            If ((\_PR.CFGD & 0x00400000))
                                            {
                                                If (^^PCI0.LPCB.EC.ADP)
                                                {
                                                    IMXW = 0x0138
                                                    IMMK = 0x02
                                                    PRM1 = 0x02
                                                    PRM0 = 0x0D
                                                    SSMP = 0xE0
                                                }
                                            }
                                        }
                                        ElseIf ((\_PR.CFGD & 0x00400000))
                                        {
                                            If (^^PCI0.LPCB.EC.ADP)
                                            {
                                                IMXW = 0x0168
                                                IMMK = 0x02
                                                PRM1 = 0x02
                                                PRM0 = 0x0D
                                                SSMP = 0xE0
                                            }
                                        }
                                    }
                                }
                                ElseIf ((Local3 == 0x03))
                                {
                                    If ((WM23 == Zero))
                                    {
                                        WM23 = 0x03
                                        ^^PCI0.LPCB.EC.ECTB = One
                                        ^^AC.ADJP (Zero)
                                        If ((\_PR.CFGD & 0x00400000))
                                        {
                                            If (^^PCI0.LPCB.EC.ADP)
                                            {
                                                IMXW = 0xF0
                                                IMMK = 0x02
                                                PRM1 = 0x02
                                                PRM0 = 0x0D
                                                SSMP = 0xE0
                                            }
                                        }
                                    }
                                }
                                Else
                                {
                                    WM23 = Zero
                                    ^^PCI0.LPCB.EC.ECTB = Zero
                                    ^^AC.ADJP (Zero)
                                    If ((\_PR.CFGD & 0x00400000))
                                    {
                                        If (^^PCI0.LPCB.EC.ADP)
                                        {
                                            IMXW = OIM1 /* \OIM1 */
                                            IMMK = 0x02
                                            PRM1 = 0x02
                                            PRM0 = 0x0D
                                            SSMP = 0xE0
                                        }
                                        Else
                                        {
                                            CIM1 = IMXW /* \IMXW */
                                            IMXW = 0x5C
                                            IMMK = 0x02
                                            PRM1 = 0x02
                                            PRM0 = 0x0D
                                            SSMP = 0xE0
                                            IMXW = CIM1 /* \CIM1 */
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                WM23 = Zero
                                ^^PCI0.LPCB.EC.ECTB = Zero
                                ^^AC.ADJP (Zero)
                                If ((\_PR.CFGD & 0x00400000))
                                {
                                    If (^^PCI0.LPCB.EC.ADP)
                                    {
                                        IMXW = OIM1 /* \OIM1 */
                                        IMMK = 0x02
                                        PRM1 = 0x02
                                        PRM0 = 0x0D
                                        SSMP = 0xE0
                                    }
                                    Else
                                    {
                                        CIM1 = IMXW /* \IMXW */
                                        IMXW = 0x5C
                                        IMMK = 0x02
                                        PRM1 = 0x02
                                        PRM0 = 0x0D
                                        SSMP = 0xE0
                                        IMXW = CIM1 /* \CIM1 */
                                    }
                                }
                            }
                        }
                        Case (0x18)
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                ^^PCI0.LPCB.EC.FDAT = (Local2 & 0xFF)
                                ^^PCI0.LPCB.EC.FCMD = 0xD4
                            }
                        }
                        Case (0x1A)
                        {
                            If (((OSYS >= 0x07DD) && (HEFE == One)))
                            {
                                If ((Local2 && One))
                                {
                                    If (^^PCI0.LPCB.EC.ECOK)
                                    {
                                        ^^PCI0.LPCB.EC.AIRP |= 0x40
                                    }
                                }
                                ElseIf (^^PCI0.LPCB.EC.ECOK)
                                {
                                    ^^PCI0.LPCB.EC.AIRP &= 0xBF
                                }
                            }
                        }

                    }

                    Return (Local0)
                }

                Return (Ones)
            }

            Method (CPKG, 3, Serialized)
            {
                Name (ARGP, Buffer (0x0100)
                {
                     0x00                                             // .
                })
                CreateQWordField (Arg2, Zero, WQW1)
                CreateQWordField (Arg2, 0x08, WQW2)
                CreateQWordField (Arg2, 0x10, WRW1)
                CreateQWordField (Arg2, 0x18, WRW2)
                ARGP = Arg2
                If ((WQW1 & One))
                {
                    If (HKDR)
                    {
                        ARGP [0x20] = EVNT /* \_SB_.WMI_.EVNT */
                    }
                }

                If (((WQW1 >> 0x04) & 0x1037))
                {
                    Local7 = Zero
                    If (((WQW1 >> 0x04) & One))
                    {
                        If (((WRW1 >> 0x04) & One))
                        {
                            ARGP [0x24] = 0x05
                        }
                        Else
                        {
                            Local7 |= One
                        }
                    }

                    If (((WQW1 >> 0x05) & One))
                    {
                        If (((WRW1 >> 0x05) & One))
                        {
                            ARGP [0x25] = 0x06
                        }
                        Else
                        {
                            Local7 |= 0x02
                        }
                    }

                    If (((WQW1 >> 0x06) & One))
                    {
                        If (((WRW1 >> 0x06) & One))
                        {
                            ARGP [0x26] = 0x07
                        }
                        Else
                        {
                            Local7 |= 0x04
                        }
                    }

                    If (((WQW1 >> 0x08) & One))
                    {
                        If (((WRW1 >> 0x08) & One))
                        {
                            ARGP [0x28] = 0x09
                        }
                        Else
                        {
                            Local7 |= 0x10
                        }
                    }

                    If (((WQW1 >> 0x09) & One))
                    {
                        If (((WRW1 >> 0x09) & One))
                        {
                            ARGP [0x29] = 0x0A
                        }
                        Else
                        {
                            Local7 |= 0x20
                        }
                    }

                    If (((WQW1 >> 0x10) & One))
                    {
                        If (((WRW1 >> 0x10) & One))
                        {
                            ARGP [0x30] = 0x11
                        }
                        Else
                        {
                            Local7 |= 0x1000
                        }
                    }

                    If (Local7)
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xA1
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                                Local2 = ^^PCI0.LPCB.EC.OEM3 /* \_SB_.PCI0.LPCB.EC__.OEM3 */
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }

                            If ((Local7 & One))
                            {
                                If ((Local2 & 0x08))
                                {
                                    If ((Local1 & 0x02))
                                    {
                                        ARGP [0x24] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x24] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x24] = 0x02
                                }
                            }

                            If ((Local7 & 0x02))
                            {
                                If ((Local2 & 0x04))
                                {
                                    If ((Local1 & One))
                                    {
                                        ARGP [0x25] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x25] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x25] = 0x02
                                }
                            }

                            If ((Local7 & 0x04))
                            {
                                If ((Local2 & 0x10))
                                {
                                    If ((Local1 & 0x04))
                                    {
                                        ARGP [0x26] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x26] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x26] = 0x02
                                }
                            }

                            If ((Local7 & 0x10))
                            {
                                If ((Local1 & 0x10))
                                {
                                    ARGP [0x28] = One
                                }
                                Else
                                {
                                    ARGP [0x28] = Zero
                                }
                            }

                            If ((Local7 & 0x20))
                            {
                                If ((Local2 & 0x20))
                                {
                                    If ((Local1 & 0x08))
                                    {
                                        ARGP [0x29] = One
                                    }
                                    Else
                                    {
                                        ARGP [0x29] = Zero
                                    }
                                }
                                Else
                                {
                                    ARGP [0x29] = 0x02
                                }
                            }

                            If ((Local7 & 0x1000))
                            {
                                If ((Local1 & 0x40))
                                {
                                    ARGP [0x30] = One
                                }
                                Else
                                {
                                    ARGP [0x30] = Zero
                                }
                            }
                        }
                        Else
                        {
                            If ((Local7 & One))
                            {
                                ARGP [0x24] = Ones
                            }

                            If ((Local7 & 0x02))
                            {
                                ARGP [0x25] = Ones
                            }

                            If ((Local7 & 0x04))
                            {
                                ARGP [0x26] = Ones
                            }

                            If ((Local7 & 0x10))
                            {
                                ARGP [0x28] = Ones
                            }

                            If ((Local7 & 0x20))
                            {
                                ARGP [0x29] = Ones
                            }

                            If ((Local7 & 0x1000))
                            {
                                ARGP [0x30] = Ones
                            }
                        }
                    }
                }

                If (((WQW1 >> 0x07) & One))
                {
                    If (((WRW1 >> 0x07) & One))
                    {
                        ARGP [0x27] = 0x08
                    }
                    Else
                    {
                    }
                }

                If (((WQW1 >> 0x0F) & One))
                {
                    If (((WRW1 >> 0x0F) & One))
                    {
                        ARGP [0x2F] = 0x10
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.SLFG)
                        {
                            Local0 |= One
                        }

                        If (\_TZ.TZ0.PPFG)
                        {
                            Local0 |= 0x02
                        }

                        ARGP [0x2F] = Local0
                    }
                }

                If (((WQW1 >> 0x11) & One))
                {
                    If (((WRW1 >> 0x11) & One))
                    {
                        ARGP [0x31] = 0x12
                    }
                    Else
                    {
                        Name (PFBF, Buffer (0x0100)
                        {
                             0x00                                             // .
                        })
                        If (PFBA)
                        {
                            OperationRegion (PFMM, SystemMemory, PFBA, 0x0100)
                            Field (PFMM, ByteAcc, NoLock, Preserve)
                            {
                                PFDB,   2048
                            }

                            PFBF = PFDB /* \_SB_.WMI_.CPKG.PFDB */
                        }

                        Return (PFBF) /* \_SB_.WMI_.CPKG.PFBF */
                    }
                }

                If (((WQW1 >> 0x12) & One))
                {
                    If (((WRW1 >> 0x12) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x32]))
                            {
                                ^^PCI0.LPCB.EC.ECKS |= 0x80
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.ECKS &= 0x7F
                            }
                        }
                    }

                    ARGP [0x32] = 0x13
                }

                If (((WQW1 >> 0x1E) & One))
                {
                    If (((WRW1 >> 0x1E) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x3E]))
                            {
                                ^^PCI0.LPCB.EC.FDAT = One
                                P80H = 0xDF
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.FDAT = Zero
                                P80H = 0x5F
                            }

                            ^^PCI0.LPCB.EC.FCMD = 0xA4
                        }
                    }

                    ARGP [0x3E] = 0x1F
                }

                If (((WQW1 >> 0x1F) & One))
                {
                    If (((WRW1 >> 0x1F) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x3F]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }

                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA2
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }

                    ARGP [0x3F] = 0x20
                }

                If (((WQW1 >> 0x20) & One))
                {
                    If (((WRW1 >> 0x20) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x40]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }

                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA3
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }

                    ARGP [0x40] = 0x21
                }

                If (((WQW1 >> 0x21) & One))
                {
                    If (((WRW1 >> 0x21) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x41]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }

                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA1
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }

                    ARGP [0x41] = 0x22
                }

                If (((WQW1 >> 0x26) & One))
                {
                    If (((WRW1 >> 0x26) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = Zero
                            ^^PCI0.LPCB.EC.FBUF = ToInteger (DerefOf (ARGP [0x47]))
                            ^^PCI0.LPCB.EC.FCMD = 0xCA
                        }
                    }

                    ARGP [0x47] = 0x27
                }

                If (((WQW1 >> 0x29) & One))
                {
                    If (((WRW1 >> 0x29) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x4C]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }

                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA5
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }

                    ARGP [0x4C] = 0x2A
                }

                If (((WQW1 >> 0x31) & One))
                {
                    CreateWordField (ARGP, 0x54, DA50)
                    If (((WRW1 >> 0x31) & One))
                    {
                        DA50 = 0x32
                    }
                    Else
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local0 = ^^PCI0.LPCB.EC.BDC0 /* \_SB_.PCI0.LPCB.EC__.BDC0 */
                        }
                        Else
                        {
                            Local0 = Ones
                        }

                        DA50 = Local0
                    }
                }

                If (((WQW1 >> 0x37) & One))
                {
                    If (((WRW1 >> 0x37) & One))
                    {
                        ARGP [0x5D] = 0x38
                    }
                    Else
                    {
                        ARGP [0x5D] = One
                    }
                }

                If (((WQW1 >> 0x38) & One))
                {
                    If (((WRW1 >> 0x38) & One))
                    {
                        ARGP [0x5E] = 0x39
                    }
                    Else
                    {
                        ARGP [0x5E] = ^^PCI0.TMSS.GTMP ()
                    }
                }

                If (((WQW1 >> 0x3B) & One))
                {
                    If (((WRW1 >> 0x3B) & One))
                    {
                        ARGP [0x61] = 0x3C
                    }
                    Else
                    {
                        Local0 = Zero
                        If (((PSF0 & 0x10) == Zero))
                        {
                            If (^^PCI0.GFX0.PDDS (0x0300))
                            {
                                Local0 = One
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                        }

                        ARGP [0x61] = Local0
                    }
                }

                If (((WQW1 >> 0x3C) & One))
                {
                    If (((WRW1 >> 0x3C) & One))
                    {
                        ARGP [0x62] = 0x3D
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = One
                            ^^PCI0.LPCB.EC.FCMD = 0xCA
                            Local0 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }

                        ARGP [0x62] = Local0
                    }
                }

                If (((WQW1 >> 0x3D) & One))
                {
                    If (((WRW1 >> 0x3D) & One))
                    {
                        ARGP [0x63] = 0x3E
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0xA2
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                            Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            If ((Local1 & 0x7E))
                            {
                                Local0 = One
                            }
                        }

                        ARGP [0x63] = Local0
                    }
                }

                If (((WQW1 >> 0x3E) & One))
                {
                    If (((WRW1 >> 0x3E) & One))
                    {
                        ARGP [0x64] = 0x3F
                    }
                    ElseIf ((MOLF == One))
                    {
                        ARGP [0x64] = 0x01000005
                    }
                    Else
                    {
                        ARGP [0x64] = Zero
                    }
                }

                If (((WQW2 >> One) & One))
                {
                    ARGP [0x67] = BKST /* \BKST */
                }

                If (((WQW2 >> 0x05) & One))
                {
                    CreateDWordField (ARGP, 0x6B, P700)
                    CreateDWordField (ARGP, 0x6F, P701)
                    CreateDWordField (ARGP, 0x73, P702)
                    CreateDWordField (ARGP, 0x77, P703)
                    If (((WRW2 >> 0x05) & One))
                    {
                        P700 = 0x46
                        P701 = Zero
                        P702 = Zero
                        P703 = Zero
                    }
                    Else
                    {
                        HKDR = One
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If ((LKFG & One))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0x05
                                ^^PCI0.LPCB.EC.FBUF = One
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }
                        }

                        P700 = PSF3 /* \PSF3 */
                        P701 = Zero
                        P702 = Zero
                        P703 = Zero
                    }
                }

                If (((WQW2 >> 0x07) & One))
                {
                    ^^AC.IGNR = One
                    ARGP [0x7C] = 0x48
                }

                If (((WQW2 >> 0x08) & One))
                {
                    Notify (PWRB, 0x80) // Status Change
                    ARGP [0x7D] = 0x49
                }

                If (((WQW2 >> 0x0B) & One))
                {
                    If (((WRW2 >> 0x0B) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0x80]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }

                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA4
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }

                    ARGP [0x80] = 0x4C
                }

                If (((WQW2 >> 0x0E) & One))
                {
                    If (((WRW2 >> 0x0E) & One))
                    {
                        Switch (ToInteger (DerefOf (ARGP [0x83])))
                        {
                            Case (Zero)
                            {
                                P80H = 0x4F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 &= 0xFFFFFFFFFFFFFFCF
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            Case (One)
                            {
                                P80H = 0x5F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x10)
                                    ^^AC.ADJP (Zero)
                                }
                            }
                            Case (0x02)
                            {
                                P80H = 0x6F
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    PSF1 = ((PSF1 & 0xFFFFFFFFFFFFFFCF) | 0x20)
                                    ^^AC.ADJP (Zero)
                                }
                            }

                        }

                        If ((NVBB & 0xFFFF))
                        {
                            If (^^PCI0.LPCB.EC.ECOK)
                            {
                                If (^^AC.ACFG)
                                {
                                    Local5 = Zero
                                    Local6 = One
                                }
                                Else
                                {
                                    Local5 = ^^PCI0.LPCB.EC.BBST /* \_SB_.PCI0.LPCB.EC__.BBST */
                                    If ((Local5 == Zero))
                                    {
                                        Local5 = (((NVBB >> 0x04) & 0xF0) | (NVBB & 
                                            0x0F))
                                        Local6 = (NVBB & 0x0F)
                                    }
                                    Else
                                    {
                                        Local6 = (Local5 & 0x0F)
                                    }
                                }

                                ^^PCI0.LPCB.EC.BBST = Local5
                                Notify (^^PCI0.PEG0.PEGP, (Local6 | 0xD0))
                            }
                        }
                    }

                    ARGP [0x83] = 0x4F
                }

                If (((WQW2 >> 0x11) & One))
                {
                    CreateDWordField (ARGP, 0x8A, P821)
                    CreateDWordField (ARGP, 0x8E, P822)
                    CreateDWordField (ARGP, 0x92, P823)
                    CreateDWordField (ARGP, 0x96, P824)
                    P821 = PSF1 /* \PSF1 */
                    P822 = Zero
                    P823 = Zero
                    P824 = Zero
                }

                If (((WQW2 >> 0x14) & One))
                {
                    If (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.INF2 |= 0x02
                    }

                    ARGP [0x9C] = 0x55
                }

                If (((WQW2 >> 0x19) & One))
                {
                    If (((WRW2 >> 0x19) & One))
                    {
                        Switch (ToInteger (DerefOf (ARGP [0xA1])))
                        {
                            Case (Zero)
                            {
                                ^^LID0.WMIF = One
                                Notify (LID0, 0x80) // Status Change
                            }
                            Case (One)
                            {
                                Notify (SLPB, 0x80) // Status Change
                            }
                            Case (0x02)
                            {
                                Notify (PWRB, 0x80) // Status Change
                            }

                        }
                    }

                    ARGP [0xA1] = 0x5A
                }

                If (((WQW2 >> 0x1A) & One))
                {
                    If (((WRW2 >> 0x1A) & One))
                    {
                        PRM1 = DerefOf (ARGP [0xA2])
                        PRM0 = 0x07
                        SSMP = 0xE0
                    }

                    ARGP [0xA2] = 0x5B
                }

                If (((WQW2 >> 0x1D) & One))
                {
                    If (((WRW2 >> 0x1D) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xA5]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }

                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA6
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }

                    ARGP [0xA5] = 0x5E
                }

                If (((WQW2 >> 0x21) & One))
                {
                    If (((WRW2 >> 0x21) & One))
                    {
                        ARGP [0xA9] = 0x62
                    }
                    Else
                    {
                        ARGP [0xA9] = Zero
                    }
                }

                If (((WQW2 >> 0x22) & One))
                {
                    CreateByteField (ARGP, 0xAA, P990)
                    CreateByteField (ARGP, 0xAB, P991)
                    CreateByteField (ARGP, 0xAC, P992)
                    If (((WRW2 >> 0x22) & One))
                    {
                        P990 = 0x63
                        P991 = Zero
                        P992 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            P991 = ^^PCI0.LPCB.EC.FBF2 /* \_SB_.PCI0.LPCB.EC__.FBF2 */
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }

                        ^^PCI0.LPCB.EC.FDAT = 0x03
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        Stall (0x05)
                        If (One)
                        {
                            P990 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            P992 = ^^PCI0.LPCB.EC.FBF2 /* \_SB_.PCI0.LPCB.EC__.FBF2 */
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        P990 = Ones
                        P991 = Ones
                        P992 = Ones
                    }
                }

                If (((WQW2 >> 0x23) & One))
                {
                    CreateByteField (ARGP, 0xAD, PH00)
                    CreateByteField (ARGP, 0xAE, PH01)
                    CreateByteField (ARGP, 0xAF, PH02)
                    If (((WRW2 >> 0x23) & One))
                    {
                        PH00 = 0x64
                        PH01 = Zero
                        PH02 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = Zero
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PH02 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            PH01 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            PH00 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PH00 = Ones
                        PH01 = Ones
                        PH02 = Ones
                    }
                }

                If (((WQW2 >> 0x24) & One))
                {
                    If (((WRW2 >> 0x24) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xB0]))
                            {
                                Local1 = 0xC2
                            }
                            Else
                            {
                                Local1 = 0xC3
                            }

                            ^^PCI0.LPCB.EC.FDAT = Local1
                            ^^PCI0.LPCB.EC.FBUF = 0xA9
                            ^^PCI0.LPCB.EC.FCMD = 0xB8
                        }
                    }

                    ARGP [0xB0] = 0x65
                }

                If (((WQW2 >> 0x26) & One))
                {
                    CreateDWordField (ARGP, 0xB2, PH30)
                    If (((WRW2 >> 0x26) & One))
                    {
                        Local2 = ((PH30 >> 0x0C) & 0x0F)
                        If ((Local2 >= 0x0A))
                        {
                            Local2 = Zero
                        }
                        Else
                        {
                            Local2 *= 0x19
                            Local2 = (0xFF - Local2)
                        }

                        Local3 = ((PH30 >> 0x10) & 0xFF)
                        Local4 = ((PH30 >> 0x18) & 0x0F)
                        Local7 = ((PH30 >> 0x1C) & 0x0F)
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (((Local7 >= 0x07) && (Local7 <= 0x0B)))
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local7
                                ^^PCI0.LPCB.EC.FCMD = 0xC4
                            }
                            Else
                            {
                                If ((Local7 == Zero))
                                {
                                    Local0 = Zero
                                    Local0 = (PH30 & 0x07)
                                    Local0 |= ((PH30 >> One) & 0x38)
                                    Local0 |= ((PH30 >> 0x02) & 0x01C0)
                                    ^^PCI0.LPCB.EC.FDAT = Local0
                                    ^^PCI0.LPCB.EC.FBUF = (Local0 >> 0x08)
                                    ^^PCI0.LPCB.EC.FCMD = 0xC2
                                }

                                If ((Local7 == One))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x03
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }

                                If ((Local7 == 0x02))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x04
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }

                                If ((Local7 == 0x03))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x06
                                    ^^PCI0.LPCB.EC.FBUF = Local3
                                    ^^PCI0.LPCB.EC.FBF1 = Local4
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }

                                If ((Local7 == 0x04))
                                {
                                    If (Local3)
                                    {
                                        Local0 = 0x0D
                                    }
                                    Else
                                    {
                                        Local0 = 0x0E
                                    }

                                    ^^PCI0.LPCB.EC.FDAT = Local0
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }

                                If ((Local7 == 0x0C)){}
                                If ((Local7 == 0x0D))
                                {
                                    ^^PCI0.LPCB.EC.FDAT = 0x02
                                    ^^PCI0.LPCB.EC.FBUF = Local2
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }

                                If ((Local7 == 0x0E))
                                {
                                    Local1 = ((PH30 >> 0x0E) & 0x1F)
                                    If ((PH30 & 0x2000))
                                    {
                                        Local1 |= 0x20
                                    }

                                    ^^PCI0.LPCB.EC.FDAT = 0x0C
                                    ^^PCI0.LPCB.EC.FBUF = Local1
                                    ^^PCI0.LPCB.EC.FCMD = 0xC4
                                }

                                If ((Local7 == 0x0F))
                                {
                                    Local6 = Zero
                                    Local3 = (PH30 & 0xFF)
                                    Local2 = ((PH30 >> 0x08) & 0xFF)
                                    Local1 = ((PH30 >> 0x10) & 0xFF)
                                    If ((Local4 < 0x03))
                                    {
                                        Local0 = (Local4 + 0x03)
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x03))
                                    {
                                        Local0 = 0x07
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x04))
                                    {
                                        Local0 = 0x06
                                        Local1 = (PH30 & 0xFF)
                                        Local6 = 0xCA
                                    }
                                    ElseIf ((Local4 == 0x06))
                                    {
                                        ^^PCI0.LPCB.EC.FDAT = 0x09
                                        ^^PCI0.LPCB.EC.FBUF = Local1
                                        ^^PCI0.LPCB.EC.FBF1 = Local2
                                        ^^PCI0.LPCB.EC.FBF2 = Local3
                                        ^^PCI0.LPCB.EC.FCMD = 0xCA
                                        Local0 = 0x0A
                                        Local6 = 0xCA
                                    }

                                    If (Local6)
                                    {
                                        ^^PCI0.LPCB.EC.FDAT = Local0
                                        ^^PCI0.LPCB.EC.FBUF = Local1
                                        ^^PCI0.LPCB.EC.FBF1 = Local2
                                        ^^PCI0.LPCB.EC.FBF2 = Local3
                                        ^^PCI0.LPCB.EC.FCMD = Local6
                                    }
                                }
                            }
                        }
                    }

                    PH30 = 0x67
                }

                If (((WQW2 >> 0x27) & One))
                {
                    CreateDWordField (ARGP, 0xB6, PH40)
                    If (((WRW2 >> 0x27) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local4 = PH40 /* \_SB_.WMI_.CPKG.PH40 */
                            ^^PCI0.LPCB.EC.FDAT = One
                            ^^PCI0.LPCB.EC.FBUF = (Local4 & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x02
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x08) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x03
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x10) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                            ^^PCI0.LPCB.EC.FDAT = 0x04
                            ^^PCI0.LPCB.EC.FBUF = ((Local4 >> 0x18) & 0xFF)
                            ^^PCI0.LPCB.EC.FCMD = 0xC1
                        }
                    }

                    PH40 = 0x68
                }

                If (((WQW2 >> 0x28) & One))
                {
                    If (((WRW2 >> 0x28) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local4 = DerefOf (ARGP [0xBA])
                            If ((Local4 & One))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = One
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }

                            If ((Local4 & 0x02))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x02
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }

                            If ((Local4 & 0x04))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x03
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }

                            If ((Local4 & 0x08))
                            {
                                ^^PCI0.LPCB.EC.FDAT = 0xFF
                                ^^PCI0.LPCB.EC.FBUF = 0x04
                                ^^PCI0.LPCB.EC.FCMD = 0xC1
                            }
                        }
                    }

                    ARGP [0xBA] = 0x69
                }

                If (((WQW2 >> 0x0191) & One))
                {
                    CreateWordField (ARGP, 0xBB, PH60)
                    If (((WRW2 >> 0x29) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            Local0 = ((PH60 >> 0x08) & 0xFF)
                            Local1 = (PH60 & 0xFF)
                            ^^PCI0.LPCB.EC.FDAT = Local0
                            ^^PCI0.LPCB.EC.FBUF = Local1
                            ^^PCI0.LPCB.EC.FCMD = 0xBA
                            P80H = PH60 /* \_SB_.WMI_.CPKG.PH60 */
                        }
                    }

                    PH60 = 0x6A
                }

                If (((WQW2 >> 0x2A) & One))
                {
                    CreateDWordField (ARGP, 0xBD, PH70)
                    If (((WRW2 >> 0x2A) & One))
                    {
                        INDX = PH70 /* \_SB_.WMI_.CPKG.PH70 */
                    }

                    PH70 = 0x6B
                }

                If (((WQW2 >> 0x2B) & One))
                {
                    If (((WRW2 >> 0x2B) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (DerefOf (ARGP [0xC1]))
                            {
                                ^^PCI0.LPCB.EC.AIRP |= 0x80
                            }
                            Else
                            {
                                ^^PCI0.LPCB.EC.AIRP &= 0x7F
                            }
                        }
                    }

                    ARGP [0xC1] = 0x6C
                }

                If (((WQW2 >> 0x2D) & One))
                {
                    CreateByteField (ARGP, 0xC3, PHA0)
                    CreateByteField (ARGP, 0xC4, PHA1)
                    CreateByteField (ARGP, 0xC5, PHA2)
                    If (((WRW2 >> 0x2D) & One))
                    {
                        PHA0 = 0x6E
                        PHA1 = Zero
                        PHA2 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = One
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PHA2 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            PHA1 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                            PHA0 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PHA0 = Ones
                        PHA1 = Ones
                        PHA2 = Ones
                    }
                }

                If (((WQW2 >> 0x2E) & One))
                {
                    CreateByteField (ARGP, 0xC6, PHB0)
                    CreateByteField (ARGP, 0xC7, PHB1)
                    CreateByteField (ARGP, 0xC8, PHB2)
                    If (((WRW2 >> 0x2E) & One))
                    {
                        PHB0 = 0x6F
                        PHB1 = Zero
                        PHB2 = Zero
                    }
                    ElseIf (^^PCI0.LPCB.EC.ECOK)
                    {
                        ^^PCI0.LPCB.EC.FDAT = 0x02
                        ^^PCI0.LPCB.EC.FCMD = 0xC0
                        If (One)
                        {
                            PHB0 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                            PHB1 = ^^PCI0.LPCB.EC.FBF2 /* \_SB_.PCI0.LPCB.EC__.FBF2 */
                            PHB2 = Zero
                            ^^PCI0.LPCB.EC.FCMD = Zero
                        }
                    }
                    Else
                    {
                        PHB0 = Ones
                        PHB1 = Ones
                        PHB2 = Ones
                    }
                }

                If (((WQW2 >> 0x2F) & One))
                {
                    CreateDWordField (ARGP, 0xC9, PHC0)
                    If (((WRW2 >> 0x2F) & One))
                    {
                        PHC0 = 0x70
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x03
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                                Local0 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                                Local0 |= (Local1 << 0x08)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }

                            ^^PCI0.LPCB.EC.FDAT = 0x04
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local2 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                                Local1 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                                Local1 |= (Local2 << 0x08)
                                Local0 |= (Local1 << 0x10)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                        }
                        Else
                        {
                            Local0 = Ones
                        }

                        PHC0 = Local0
                    }
                }

                If (((WQW2 >> 0x30) & One))
                {
                    CreateDWordField (ARGP, 0xCD, PHD0)
                    If (((WRW2 >> 0x30) & One))
                    {
                        PHD0 = 0x71
                    }
                    Else
                    {
                        Local0 = Zero
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            ^^PCI0.LPCB.EC.FDAT = 0x05
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local1 = ^^PCI0.LPCB.EC.FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                                Local0 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                                Local0 |= (Local1 << 0x08)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }

                            ^^PCI0.LPCB.EC.FDAT = 0x02
                            ^^PCI0.LPCB.EC.FCMD = 0xC0
                            If (One)
                            {
                                Local2 = ^^PCI0.LPCB.EC.FBUF /* \_SB_.PCI0.LPCB.EC__.FBUF */
                                Local1 = ^^PCI0.LPCB.EC.FBF1 /* \_SB_.PCI0.LPCB.EC__.FBF1 */
                                Local1 |= (Local2 << 0x08)
                                Local0 |= (Local1 << 0x10)
                                ^^PCI0.LPCB.EC.FCMD = Zero
                            }
                        }
                        Else
                        {
                            Local0 = Ones
                        }

                        PHD0 = Local0
                    }
                }

                If (((WQW2 >> 0x32) & One))
                {
                    CreateDWordField (ARGP, 0xD2, PHF0)
                    If (((WRW2 >> 0x32) & One))
                    {
                        PHF0 = 0x73
                    }
                    Else
                    {
                        Local1 = (INDX & 0xFFFF)
                        Local2 = ((INDX >> 0x10) & 0xFFFF)
                        If ((Local2 > 0x02))
                        {
                            Local2 = Zero
                        }

                        If ((Local1 > 0xFF))
                        {
                            PHF0 = Zero
                        }
                        Else
                        {
                            Local2 = (One << Local2)
                            Local3 = Local2
                            Local3--
                            If (((Local1 + Local3) > 0xFF))
                            {
                                PHF0 = Zero
                            }
                            Else
                            {
                                Local0 = (Local1 + 0xFF700100)
                                Name (RBUF, Buffer (0x04)
                                {
                                     0x00, 0x00, 0x00, 0x00                           // ....
                                })
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    OperationRegion (RH2M, SystemMemory, Local0, Local2)
                                    Switch (ToInteger (Local2))
                                    {
                                        Case (One)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMB,   8
                                            }

                                            RBUF = RHMB /* \_SB_.WMI_.CPKG.RHMB */
                                        }
                                        Case (0x02)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMW,   16
                                            }

                                            RBUF = RHMW /* \_SB_.WMI_.CPKG.RHMW */
                                        }
                                        Case (0x04)
                                        {
                                            Field (RH2M, ByteAcc, Lock, Preserve)
                                            {
                                                RHMD,   32
                                            }

                                            RBUF = RHMD /* \_SB_.WMI_.CPKG.RHMD */
                                        }

                                    }

                                    PHF0 = RBUF /* \_SB_.WMI_.CPKG.RBUF */
                                }
                            }
                        }
                    }
                }

                If (((WQW2 >> 0x33) & One))
                {
                    CreateDWordField (ARGP, 0xD6, PHG0)
                    CreateField (PHG0, Zero, One, SMUT)
                    CreateField (PHG0, One, 0x07, SAUD)
                    If (((WRW2 >> 0x33) & One))
                    {
                        If (^^PCI0.LPCB.EC.ECOK)
                        {
                            If (ToInteger (SMUT))
                            {
                                Local0 = Zero
                            }
                            Else
                            {
                                Local0 = ToInteger (SAUD)
                                If ((Local0 > 0x64))
                                {
                                    Local0 = 0x64
                                }
                            }

                            If (((LKFG & 0x0C) == 0x04)){}
                            Else
                            {
                                ^^PCI0.LPCB.EC.FDAT = Local0
                                ^^PCI0.LPCB.EC.FCMD = 0xC6
                            }
                        }
                    }

                    PHG0 = 0x74
                }

                If (((WQW2 >> 0x34) & One))
                {
                    CreateDWordField (ARGP, 0xDA, PHH0)
                    If (((WRW2 >> 0x34) & One))
                    {
                        Local1 = (INDX & 0xFFFF)
                        Local2 = ((INDX >> 0x10) & 0xFFFF)
                        If ((Local2 > 0x02))
                        {
                            Local2 = Zero
                        }

                        If ((Local1 > 0xFF))
                        {
                            PHH0 = Ones
                        }
                        Else
                        {
                            Local2 = (One << Local2)
                            Local3 = Local2
                            Local3--
                            If (((Local1 + Local3) > 0xFF))
                            {
                                PHH0 = Ones
                            }
                            Else
                            {
                                Local0 = (Local1 + 0xFF700100)
                                If (^^PCI0.LPCB.EC.ECOK)
                                {
                                    Name (WBUF, Buffer (0x04)
                                    {
                                         0x00, 0x00, 0x00, 0x00                           // ....
                                    })
                                    CreateByteField (WBUF, Zero, ARGB)
                                    CreateWordField (WBUF, Zero, ARGW)
                                    CreateDWordField (WBUF, Zero, ARGD)
                                    WBUF = PHH0 /* \_SB_.WMI_.CPKG.PHH0 */
                                    If (((Local1 <= 0xD9) && ((Local1 + Local3) >= 
                                        0xD9)))
                                    {
                                        Local4 = (0xD9 - Local1)
                                        Local6 = (DerefOf (WBUF [Local4]) & 0x40)
                                        Local7 = (^^PCI0.LPCB.EC.AIRP & 0xBF)
                                        WBUF [Local4] = (Local6 | Local7)
                                    }

                                    OperationRegion (WH2M, SystemMemory, Local0, Local2)
                                    Switch (ToInteger (Local2))
                                    {
                                        Case (One)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMB,   8
                                            }

                                            WHMB = ARGB /* \_SB_.WMI_.CPKG.ARGB */
                                        }
                                        Case (0x02)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMW,   16
                                            }

                                            WHMW = ARGW /* \_SB_.WMI_.CPKG.ARGW */
                                        }
                                        Case (0x04)
                                        {
                                            Field (WH2M, ByteAcc, Lock, Preserve)
                                            {
                                                WHMD,   32
                                            }

                                            WHMD = ARGD /* \_SB_.WMI_.CPKG.ARGD */
                                        }

                                    }

                                    If (((Local1 <= 0xF8) && ((Local1 + Local3) >= 
                                        0xF8)))
                                    {
                                        Local4 = (0xF8 - Local1)
                                        ^^PCI0.LPCB.EC.FCMD = DerefOf (WBUF [Local4])
                                    }

                                    PHH0 = 0x75
                                }
                                Else
                                {
                                    PHH0 = Ones
                                }
                            }
                        }
                    }
                    Else
                    {
                        PHH0 = 0x75
                    }
                }

                If (((WQW2 >> 0x36) & One))
                {
                    CreateByteField (ARGP, 0xDF, PB90)
                    CreateByteField (ARGP, 0xE0, PB91)
                    CreateByteField (ARGP, 0xE1, PB92)
                    If (((WRW2 >> 0x36) & One))
                    {
                        PB90 = 0x77
                        PB91 = Zero
                        PB92 = Zero
                    }
                    Else
                    {
                        PB90 = (BAEE >> One)
                        PB91 = BSCP /* \BSCP */
                        PB92 = BTCP /* \BTCP */
                    }
                }

                If (((WQW2 >> 0x39) & One))
                {
                    CreateDWordField (ARGP, 0xE4, PC20)
                    CreateDWordField (ARGP, 0xE8, PC21)
                    CreateDWordField (ARGP, 0xEC, PC22)
                    CreateDWordField (ARGP, 0xF0, PC23)
                    If (((WRW2 >> 0x39) & One))
                    {
                        PC20 = 0x7A
                        PC21 = Zero
                        PC22 = Zero
                        PC23 = Zero
                    }
                    Else
                    {
                        Local0 = (PSF2 & 0xFFFFFFFFFFFFFBFF)
                        If (PSTG ())
                        {
                            Local0 |= 0x0400
                        }

                        If ((\_PR.CFGD & 0x00400000))
                        {
                            Local0 |= 0x40000000
                        }

                        PC20 = Local0
                        PC21 = Zero
                        PC22 = Zero
                        PC23 = Zero
                    }
                }

                Return (ARGP) /* \_SB_.WMI_.CPKG.ARGP */
            }

            Method (OCWR, 3, NotSerialized)
            {
                Name (OCMA, Buffer (0x0100)
                {
                     0x00                                             // .
                })
                CreateDWordField (OCMA, 0xC0, SDA0)
                CreateDWordField (OCMA, 0xC4, SDA1)
                CreateDWordField (OCMA, 0xC8, SDA2)
                CreateDWordField (OCMA, 0xCC, SDA3)
                CreateDWordField (OCMA, 0xD0, SDA4)
                CreateDWordField (OCMA, 0xD4, SDA5)
                CreateDWordField (OCMA, 0xD8, SDA6)
                CreateDWordField (OCMA, 0xDC, SDA7)
                OCMA = Arg2
                If (PFBA)
                {
                    OperationRegion (TOCM, SystemMemory, PFBA, 0x0100)
                    Field (TOCM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xC0), 
                        TDA0,   32, 
                        TDA1,   32, 
                        TDA2,   32, 
                        TDA3,   32, 
                        TDA4,   32, 
                        TDA5,   32, 
                        TDA6,   32, 
                        TDA7,   32
                    }

                    TDA0 = SDA0 /* \_SB_.WMI_.OCWR.SDA0 */
                    TDA1 = SDA1 /* \_SB_.WMI_.OCWR.SDA1 */
                    TDA2 = SDA2 /* \_SB_.WMI_.OCWR.SDA2 */
                    TDA3 = SDA3 /* \_SB_.WMI_.OCWR.SDA3 */
                    TDA4 = SDA4 /* \_SB_.WMI_.OCWR.SDA4 */
                    TDA5 = SDA5 /* \_SB_.WMI_.OCWR.SDA5 */
                    TDA6 = SDA6 /* \_SB_.WMI_.OCWR.SDA6 */
                    TDA7 = SDA7 /* \_SB_.WMI_.OCWR.SDA7 */
                    PRM0 = 0x0F
                    SSMP = 0xE0
                }

                Return (0x03)
            }

            Method (WMBB, 3, Serialized)
            {
                P8XH (Zero, Arg1)
                Switch (Arg1)
                {
                    Case (0x02)
                    {
                        Return (CPKG (Arg0, Arg1, Arg2))
                    }
                    Case (0x03)
                    {
                        Return (OCWR (Arg0, Arg1, Arg2))
                    }
                    Case (Package (0x26)
                        {
                            One, 
                            0x05, 
                            0x06, 
                            0x07, 
                            0x08, 
                            0x09, 
                            0x0A, 
                            0x10, 
                            0x11, 
                            0x12, 
                            0x32, 
                            0x33, 
                            0x34, 
                            0x38, 
                            0x39, 
                            0x3B, 
                            0x3C, 
                            0x3D, 
                            0x3E, 
                            0x3F, 
                            0x40, 
                            0x41, 
                            0x42, 
                            0x43, 
                            0x45, 
                            0x51, 
                            0x52, 
                            0x62, 
                            0x63, 
                            0x64, 
                            0x6D, 
                            0x6E, 
                            0x6F, 
                            0x70, 
                            0x71, 
                            0x73, 
                            0x77, 
                            0x7A
                        }

)
                    {
                        Return (GCMD (Arg0, Arg1, Arg2))
                    }
                    Case (Package (0x26)
                        {
                            0x13, 
                            0x14, 
                            0x1D, 
                            0x1F, 
                            0x20, 
                            0x21, 
                            0x22, 
                            0x26, 
                            0x27, 
                            0x2A, 
                            0x2C, 
                            0x31, 
                            0x46, 
                            0x47, 
                            0x48, 
                            0x49, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x4F, 
                            0x55, 
                            0x56, 
                            0x57, 
                            0x5A, 
                            0x5B, 
                            0x5E, 
                            0x65, 
                            0x66, 
                            0x67, 
                            0x68, 
                            0x69, 
                            0x6A, 
                            0x6B, 
                            0x6C, 
                            0x74, 
                            0x75, 
                            0x76, 
                            0x79
                        }

)
                    {
                        Return (SCMD (Arg0, Arg1, Arg2))
                    }

                }

                Return (Ones)
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
            {
                Return (Zero)
            }
        }

        Device (HIDD)
        {
            Name (_HID, "INT33D5")  // _HID: Hardware ID
            Name (HBSY, Zero)
            Name (HIDX, Zero)
            Name (HMDE, Zero)
            Name (HRDY, Zero)
            Name (BTLD, Zero)
            Name (BTS1, Zero)
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If (((OSYS >= 0x07DD) && (HEFE == One)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (HDDM, 0, Serialized)
            {
                Name (DPKG, Package (0x04)
                {
                    0x11111111, 
                    0x22222222, 
                    0x33333333, 
                    0x44444444
                })
                Return (DPKG) /* \_SB_.HIDD.HDDM.DPKG */
            }

            Method (HDEM, 0, Serialized)
            {
                HBSY = Zero
                If ((HMDE == Zero))
                {
                    Return (HIDX) /* \_SB_.HIDD.HIDX */
                }

                Return (HMDE) /* \_SB_.HIDD.HMDE */
            }

            Method (HDMM, 0, Serialized)
            {
                Return (HMDE) /* \_SB_.HIDD.HMDE */
            }

            Method (HDSM, 1, Serialized)
            {
                HRDY = Arg0
            }

            Method (HPEM, 1, Serialized)
            {
                HBSY = One
                If ((HMDE == Zero))
                {
                    HIDX = Arg0
                }
                Else
                {
                    HIDX = Arg0
                }

                Notify (HIDD, 0xC0) // Hardware-Specific
                Local0 = Zero
                While (((Local0 < 0xFA) && HBSY))
                {
                    Sleep (0x04)
                    Local0++
                }

                If ((HBSY == One))
                {
                    HBSY = Zero
                    HIDX = Zero
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (BTNL, 0, Serialized)
            {
                BTLD = One
                If ((AEAB == One))
                {
                    BTS1 = 0x1F
                }
                Else
                {
                    BTS1 = Zero
                }
            }

            Method (BTNE, 1, Serialized)
            {
                If ((AEAB == One))
                {
                    BTS1 = ((Arg0 & 0x1E) | One)
                }
            }

            Method (BTNS, 0, Serialized)
            {
                If ((AEAB == One)){}
                Return (BTS1) /* \_SB_.HIDD.BTS1 */
            }

            Method (BTNC, 0, Serialized)
            {
                If ((AEAB == One))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (HEB2, Zero)
            Method (HEBC, 0, Serialized)
            {
                If ((AHDB == One))
                {
                    Return (HEB1) /* \HEB1 */
                }
                Else
                {
                    Return (0x02)
                }
            }

            Method (HEEC, 0, Serialized)
            {
                If ((AHDB == One))
                {
                    Return (HEB2) /* \_SB_.HIDD.HEB2 */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("eeec56b3-4442-408f-a792-4edd4d758054") /* Unknown UUID */))
                {
                    If ((One == ToInteger (Arg1)))
                    {
                        Switch (ToInteger (Arg2))
                        {
                            Case (Zero)
                            {
                                Return (Buffer (0x02)
                                {
                                     0xFF, 0x01                                       // ..
                                })
                            }
                            Case (One)
                            {
                                BTNL ()
                            }
                            Case (0x02)
                            {
                                Return (HDMM ())
                            }
                            Case (0x03)
                            {
                                HDSM (DerefOf (Arg3 [Zero]))
                            }
                            Case (0x04)
                            {
                                Return (HDEM ())
                            }
                            Case (0x05)
                            {
                                Return (BTNS ())
                            }
                            Case (0x06)
                            {
                                BTNE (DerefOf (Arg3 [Zero]))
                            }
                            Case (0x07)
                            {
                                Return (HEBC ())
                            }
                            Case (0x08)
                            {
                            }

                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (TMSS)
        {
            Name (_ADR, 0x00140002)  // _ADR: Address
            OperationRegion (TMBR, PCI_Config, Zero, 0x0100)
            Field (TMBR, WordAcc, NoLock, Preserve)
            {
                VDID,   32, 
                CMD,    8, 
                Offset (0x10), 
                BARL,   32, 
                BARH,   32
            }

            Method (GTMP, 0, NotSerialized)
            {
                If (((VDID != 0xFFFFFFFF) && ((CMD & 0x02) && (
                    BARL & 0xFFFFF000))))
                {
                    Local0 = Zero
                    Local1 = BARH /* \_SB_.PCI0.TMSS.BARH */
                    Local1 <<= 0x20
                    Local1 |= (BARL & 0xFFFFF000)
                    OperationRegion (TRMM, SystemMemory, Local1, 0x0100)
                    Field (TRMM, DWordAcc, NoLock, Preserve)
                    {
                        TEMP,   9
                    }

                    Local0 = TEMP /* \_SB_.PCI0.TMSS.GTMP.TEMP */
                }
                Else
                {
                    Local0 = Ones
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
            Method (_GPE, 0, NotSerialized)  // _GPE: General Purpose Events
            {
                Return (GGPE (0x01060003))
            }

            Name (ECOK, Zero)
            Name (SLFG, Zero)
            Name (ECTB, Zero)
            Name (B15C, Zero)
            Name (ESCF, Zero)
            Name (GP12, Zero)
            Name (XX68, Zero)
            Name (XXC7, Zero)
            Name (XXCA, Zero)
            Name (XXD7, Zero)
            Name (XXDA, Zero)
            Name (XXDD, Zero)
            Name (XXE2, Zero)
            Name (XXF0, Zero)
            Name (XXF2, Zero)
            Name (XXF4, Zero)
            Name (NACT, 0x02)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If (((Arg0 == 0x03) && (Arg1 == One)))
                {
                    If ((PSF0 & One))
                    {
                        ECOK = Arg1
                        Local0 = 0x02
                        If ((OSYS < 0x07DC))
                        {
                            If ((OSYS == 0x03E8))
                            {
                                Local0 = One
                            }
                            ElseIf ((OSYS == 0x07D9))
                            {
                                Local0 = 0x08
                            }
                            Else
                            {
                                Local0 = Zero
                            }
                        }

                        ECOS = Local0
                        If ((OSYS >= 0x07D6))
                        {
                            WINF |= One
                        }
                        ElseIf ((OSYS == 0x03E8))
                        {
                            WINF |= One
                        }

                        Local0 = INF2 /* \_SB_.PCI0.LPCB.EC__.INF2 */
                        If ((PSF0 & 0x02))
                        {
                            Local0 &= 0xDF
                        }

                        If ((PSF0 & 0x20))
                        {
                            Local0 |= One
                        }
                        Else
                        {
                            Local0 &= 0xFE
                        }

                        If ((OSYS < 0x07D9))
                        {
                            Local0 &= 0xFD
                        }

                        INF2 = Local0
                        If ((OSYS == 0x03E8)){}
                        ^^^^AC.ACFG = ADP /* \_SB_.PCI0.LPCB.EC__.ADP_ */
                    }

                    SLFG = Zero
                    ECTB = Zero
                    B15C = Zero
                    PNOT ()
                }

                If ((\_PR.CFGD & 0x00400000))
                {
                    If (ADP)
                    {
                        If (PIM1)
                        {
                            IMXW = OIM1 /* \OIM1 */
                            IMMK = 0x02
                            PRM1 = 0x02
                            PRM0 = 0x0D
                            SSMP = 0xE0
                        }
                    }
                    Else
                    {
                        CIM1 = IMXW /* \IMXW */
                        IMXW = 0x5C
                        IMMK = 0x02
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                        IMXW = CIM1 /* \CIM1 */
                    }
                }
            }

            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x62, 0x00, 0x62, 0x00, 0x00, 0x01,  // G.b.b...
                /* 0008 */  0x47, 0x01, 0x66, 0x00, 0x66, 0x00, 0x00, 0x01,  // G.f.f...
                /* 0010 */  0x79, 0x00                                       // y.
            })
            OperationRegion (RAM, SystemMemory, 0xFF700100, 0x0100)
            Field (RAM, ByteAcc, Lock, Preserve)
            {
                NMSG,   8, 
                SLED,   4, 
                Offset (0x02), 
                MODE,   1, 
                FAN0,   1, 
                TME0,   1, 
                TME1,   1, 
                FAN1,   1, 
                    ,   2, 
                Offset (0x03), 
                LSTE,   1, 
                LSW0,   1, 
                LWKE,   1, 
                WAKF,   1, 
                    ,   2, 
                PWKE,   1, 
                MWKE,   1, 
                AC0,    8, 
                PSV,    8, 
                CRT,    8, 
                TMP,    8, 
                AC1,    8, 
                BBST,   8, 
                Offset (0x0B), 
                Offset (0x0C), 
                Offset (0x0D), 
                Offset (0x0E), 
                SLPT,   8, 
                SWEJ,   1, 
                SWCH,   1, 
                Offset (0x10), 
                ADP,    1, 
                AFLT,   1, 
                BAT0,   1, 
                BAT1,   1, 
                    ,   3, 
                PWOF,   1, 
                WFNO,   8, 
                BPU0,   32, 
                BDC0,   32, 
                BFC0,   32, 
                BTC0,   32, 
                BDV0,   32, 
                BST0,   32, 
                BPR0,   32, 
                BRC0,   32, 
                BPV0,   32, 
                BTP0,   16, 
                BRS0,   16, 
                BCW0,   32, 
                BCL0,   32, 
                BCG0,   32, 
                BG20,   32, 
                BMO0,   64, 
                BIF0,   64, 
                BSN0,   32, 
                BTY0,   64, 
                Offset (0x67), 
                Offset (0x68), 
                ECOS,   8, 
                LNXD,   8, 
                ECPS,   8, 
                Offset (0x6C), 
                BTMP,   16, 
                EVTN,   8, 
                Offset (0x72), 
                PRCL,   8, 
                PRC0,   8, 
                PRC1,   8, 
                PRCM,   8, 
                PRIN,   8, 
                PSTE,   8, 
                PCAD,   8, 
                PEWL,   8, 
                PWRL,   8, 
                PECD,   8, 
                PEHI,   8, 
                PECI,   8, 
                PEPL,   8, 
                PEPM,   8, 
                PWFC,   8, 
                PECC,   8, 
                PDT0,   8, 
                PDT1,   8, 
                PDT2,   8, 
                PDT3,   8, 
                PRFC,   8, 
                PRS0,   8, 
                PRS1,   8, 
                PRS2,   8, 
                PRS3,   8, 
                PRS4,   8, 
                PRCS,   8, 
                PEC0,   8, 
                PEC1,   8, 
                PEC2,   8, 
                PEC3,   8, 
                CMDR,   8, 
                CVRT,   8, 
                GTVR,   8, 
                FANT,   8, 
                SKNT,   8, 
                AMBT,   8, 
                MCRT,   8, 
                DIM0,   8, 
                DIM1,   8, 
                PMAX,   8, 
                PPDT,   8, 
                PECH,   8, 
                PMDT,   8, 
                TSD0,   8, 
                TSD1,   8, 
                TSD2,   8, 
                TSD3,   8, 
                CPUP,   16, 
                MCHP,   16, 
                SYSP,   16, 
                CPAP,   16, 
                MCAP,   16, 
                SYAP,   16, 
                CFSP,   16, 
                CPUE,   16, 
                Offset (0xC6), 
                Offset (0xC7), 
                VGAT,   8, 
                OEM1,   8, 
                OEM2,   8, 
                OEM3,   16, 
                OEM4,   8, 
                Offset (0xCE), 
                DUT1,   8, 
                DUT2,   8, 
                RPM1,   16, 
                RPM2,   16, 
                RPM4,   16, 
                Offset (0xD7), 
                DTHL,   8, 
                DTBP,   8, 
                AIRP,   8, 
                WINF,   8, 
                RINF,   8, 
                Offset (0xDD), 
                INF2,   8, 
                MUTE,   1, 
                Offset (0xE0), 
                RPM3,   16, 
                ECKS,   8, 
                Offset (0xE4), 
                    ,   1, 
                KBDT,   1, 
                    ,   2, 
                XTUF,   1, 
                EP12,   1, 
                    ,   1, 
                GOCF,   1, 
                INF3,   8, 
                Offset (0xE7), 
                GFOF,   8, 
                Offset (0xF0), 
                PL1T,   16, 
                PL2T,   16, 
                TAUT,   8
            }

            OperationRegion (EC81, EmbeddedControl, Zero, 0xFF)
            Field (EC81, ByteAcc, Lock, Preserve)
            {
                Offset (0xF8), 
                FCMD,   8, 
                FDAT,   8, 
                FBUF,   8, 
                FBF1,   8, 
                FBF2,   8, 
                FBF3,   8
            }

            Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x0A
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = OEM4 /* \_SB_.PCI0.LPCB.EC__.OEM4 */
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x0B
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = OEM4 /* \_SB_.PCI0.LPCB.EC__.OEM4 */
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q0C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x0C
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = 0xFB
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q0D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x0D
                P80H = 0x15
            }

            Method (_Q0E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x0E
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = 0xFA
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q0F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x0F
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = 0xFA
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x10
                If ((OSYS == 0x03E8))
                {
                    If ((PSF0 & 0x10))
                    {
                        Notify (^^^PEG0.PEGP, 0x80) // Status Change
                    }
                    Else
                    {
                        Notify (GFX0, 0x80) // Status Change
                    }
                }
                ElseIf (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = 0x94
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x11
                If ((WINF & One))
                {
                    If ((OSYS == 0x03E8))
                    {
                        If ((PSF0 & 0x10))
                        {
                            Notify (^^^PEG0.PEGP.LCD0, 0x87) // Device-Specific
                        }
                        Else
                        {
                            Notify (^^^GFX0.DD1F (), 0x87) // Device-Specific
                        }
                    }
                    ElseIf ((PSF0 & 0x10))
                    {
                        Notify (^^^PEG0.PEGP.LCD0, 0x87) // Device-Specific
                    }
                    Else
                    {
                        Notify (^^^GFX0.DD1F (), 0x87) // Device-Specific
                    }
                }
                ElseIf (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = (OEM2 + 0xE0)
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x12
                If ((WINF & One))
                {
                    If ((OSYS == 0x03E8))
                    {
                        If ((PSF0 & 0x10))
                        {
                            Notify (^^^PEG0.PEGP.LCD0, 0x86) // Device-Specific
                        }
                        Else
                        {
                            Notify (^^^GFX0.DD1F (), 0x86) // Device-Specific
                        }
                    }
                    ElseIf ((PSF0 & 0x10))
                    {
                        Notify (^^^PEG0.PEGP.LCD0, 0x86) // Device-Specific
                    }
                    Else
                    {
                        Notify (^^^GFX0.DD1F (), 0x86) // Device-Specific
                    }
                }
                ElseIf (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = (OEM2 + 0xE0)
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q13, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x13
                If ((OSYS == 0x03E8)){}
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = OEM4 /* \_SB_.PCI0.LPCB.EC__.OEM4 */
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x14
                If (((OSYS >= 0x07DD) && (HEFE == One)))
                {
                    ^^^^HIDD.HPEM (0x08)
                }
                Else
                {
                }
            }

            Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x15
                P80H = 0x0D
                If (^^^^LID0.LIDF)
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xC2
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }
                }
                Else
                {
                    Notify (SLPB, 0x80) // Status Change
                }
            }

            Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x16
                If ((\_PR.CFGD & 0x00400000))
                {
                    If (ADP)
                    {
                        If (PIM1)
                        {
                            IMXW = OIM1 /* \OIM1 */
                            IMMK = 0x02
                            PRM1 = 0x02
                            PRM0 = 0x0D
                            SSMP = 0xE0
                        }
                    }
                    Else
                    {
                        CIM1 = IMXW /* \IMXW */
                        IMXW = 0x5C
                        IMMK = 0x02
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                        IMXW = CIM1 /* \CIM1 */
                    }
                }

                ^^^^AC.ACFG = ADP /* \_SB_.PCI0.LPCB.EC__.ADP_ */
                Notify (AC, 0x80) // Status Change
                Sleep (0x01F4)
                If (BAT0)
                {
                    Notify (^^^^BAT0, 0x81) // Information Change
                    Sleep (0x32)
                    Notify (^^^^BAT0, 0x80) // Status Change
                    Sleep (0x32)
                }

                If ((NVBB & 0xFFFF))
                {
                    If ((ADP == One))
                    {
                        BBST = Zero
                        Local0 = (NVBB & 0x0F)
                    }
                    Else
                    {
                        Local0 = (NVBB & 0x0F)
                        Local0++
                        BBST = (((NVBB >> 0x04) & 0xF0) | Local0)
                        GP12 = One
                        EP12 = Zero
                    }

                    If ((ADP == One))
                    {
                        Notify (^^^PEG0.PEGP, (Local0 | 0xD0))
                    }
                    Else
                    {
                        Notify (^^^PEG0.PEGP, 0xD2) // Hardware-Specific
                    }
                }

                ^^^^AC.ADJP (Zero)
            }

            Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x17
                Notify (^^^^BAT0, 0x81) // Information Change
            }

            Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x19
                Notify (^^^^BAT0, 0x81) // Information Change
                If ((PSF0 & 0x10))
                {
                    Notify (^^^PEG0.PEGP.LCD0, 0x88) // Device-Specific
                }
                ElseIf ((^^^GFX0.CDDS (0x0410) == 0x1F))
                {
                    Notify (^^^GFX0.LCD0, 0x88) // Device-Specific
                }

                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = 0xB7
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q1B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x1B
                If (^^^^LID0.LIDF)
                {
                    If (LSTE)
                    {
                        Notify (LID0, 0x80) // Status Change
                    }
                    ElseIf (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xC0
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }
                }
                Else
                {
                    Notify (LID0, 0x80) // Status Change
                }
            }

            Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x1C
                Notify (\_TZ.TZ0, 0x81) // Thermal Trip Point Change
                Notify (\_TZ.TZ0, 0x80) // Thermal Status Change
            }

            Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x1D
                Notify (PWRB, 0x80) // Status Change
            }

            Method (_Q1E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x1E
                If ((PSF0 & 0x10))
                {
                    Notify (^^^PEG0.PEGP.LCD0, 0x88) // Device-Specific
                }
                ElseIf ((^^^GFX0.CDDS (0x0410) == 0x1F))
                {
                    Notify (^^^GFX0.LCD0, 0x88) // Device-Specific
                }

                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = 0xB7
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q24, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x24
            }

            Method (_Q35, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x35
                If (^^^^WMI.HKDR)
                {
                    If ((OEM3 & 0x8000))
                    {
                        SLFG = One
                        ^^^^WMI.EVNT = 0xDE
                    }
                    Else
                    {
                        SLFG = Zero
                        ^^^^WMI.EVNT = 0xDF
                    }
                }

                Notify (WMI, 0xD0) // Hardware-Specific
                ^^^^AC.ADJP (Zero)
            }

            Method (_Q36, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x36
            }

            Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x37
                Local0 = OEM3 /* \_SB_.PCI0.LPCB.EC__.OEM3 */
                If ((Local0 & 0x2000))
                {
                    B15C = One
                }
                Else
                {
                    B15C = Zero
                }

                If ((NVBB & 0xFFFF))
                {
                    If (((PSF1 & 0x30) != 0x20))
                    {
                        BBST = Zero
                        Local1 = (NVBB & 0x0F)
                    }
                    Else
                    {
                        If ((Local0 & 0x2000))
                        {
                            Local1 = (((NVBB >> 0x08) & 0xFF) + (NVBB & 0xFF
                                ))
                            Local1--
                        }
                        Else
                        {
                            Local1 = (NVBB & 0x0F)
                        }

                        BBST = (((NVBB >> 0x04) & 0xF0) | Local1)
                    }

                    Notify (^^^PEG0.PEGP, (Local1 | 0xD0))
                }

                ^^^^AC.ADJP (Zero)
            }

            Method (_Q39, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x39
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = OEM4 /* \_SB_.PCI0.LPCB.EC__.OEM4 */
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q40, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x40
                If (^^^^WMI.HKDR)
                {
                    ^^^^WMI.EVNT = 0xFE
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x41
            }

            Method (_Q42, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x42
                ECTB = One
                ^^^^AC.ADJP (Zero)
            }

            Method (_Q46, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x46
            }

            Method (_Q4A, 0, Serialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x4A
                Local0 = OEM4 /* \_SB_.PCI0.LPCB.EC__.OEM4 */
                Switch (ToInteger (Local0))
                {
                    Case (0xCC)
                    {
                        If (^^^^WMI.HKDR)
                        {
                            Local0 = 0xBA
                            If ((PSF2 & 0x00400000))
                            {
                                Local5 = (^^^^WMI.GHPI () & 0xFF)
                                If ((Local5 != 0xFF))
                                {
                                    If (ECOK)
                                    {
                                        FDAT = 0x72
                                        FCMD = 0xD2
                                        Local1 = FDAT /* \_SB_.PCI0.LPCB.EC__.FDAT */
                                        Local0 = ((Local1 << 0x08) | 0x62)
                                    }
                                }
                            }

                            ^^^^WMI.EVNT = Local0
                            Notify (WMI, 0xD0) // Hardware-Specific
                        }
                    }
                    Case (0xCB)
                    {
                        If (^^^^WMI.HKDR)
                        {
                            If ((PSF2 & 0x00400000))
                            {
                                Local0 = 0x63
                            }
                            Else
                            {
                                Local0 = 0xBB
                            }

                            ^^^^WMI.EVNT = Local0
                            Notify (WMI, 0xD0) // Hardware-Specific
                        }
                    }

                }
            }

            Method (_Q50, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x50
                Local0 = OEM4 /* \_SB_.PCI0.LPCB.EC__.OEM4 */
                If ((Local0 == 0x74))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x74
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x75))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x75
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x7B))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x7B
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x80))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x83
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    If ((OSYS == 0x03E8)){}
                    Return (Zero)
                }

                If ((Local0 == 0x81))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x81
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    If ((OSYS == 0x03E8)){}
                    Return (Zero)
                }

                If ((Local0 == 0x82))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x82
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    If ((OSYS == 0x03E8)){}
                    Return (Zero)
                }

                If ((Local0 == 0x89))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x89
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x8A))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x8A
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x8B))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x8B
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x8C))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x8C
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x8D))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x8D
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x8E))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x8E
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0x9E))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x9E
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    If ((OSYS == 0x03E8)){}
                    Return (Zero)
                }

                If ((Local0 == 0x9F))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x9F
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    If ((OSYS == 0x03E8)){}
                    Return (Zero)
                }

                If ((Local0 == 0xA0))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x9B
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xA8))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x95
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xA9))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x9C
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xAB))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x84
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xAE))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x86
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xAF))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x86
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xB0))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x7F
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xC7))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xC7
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xC8))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xC8
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xC9))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xC9
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xCA))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xCA
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xCF))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xCB
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xD0))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0xCC
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xF2))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x70
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }

                If ((Local0 == 0xF3))
                {
                    If (^^^^WMI.HKDR)
                    {
                        ^^^^WMI.EVNT = 0x8F
                        Notify (WMI, 0xD0) // Hardware-Specific
                    }

                    Return (Zero)
                }
            }

            Method (_Q51, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x51
                If ((NVBB & 0xFFFF))
                {
                    Local0 = BBST /* \_SB_.PCI0.LPCB.EC__.BBST */
                    Local1 = ((Local0 >> 0x04) & 0x0F)
                    Local2 = (Local0 & 0x0F)
                    Local3 = ((NVBB >> 0x08) & 0xFF)
                    Local4 = (NVBB & 0xFF)
                    If ((Local1 != Local3))
                    {
                        Local1 = Local3
                    }

                    Local5 = (Local3 + Local4)
                    Local5--
                    If ((Local2 > Local5))
                    {
                        Local2 = Local5
                    }

                    If ((Local2 < Local4))
                    {
                        Local2 = Local4
                    }

                    Local2--
                    If ((Local2 < Local4))
                    {
                        Local2 = Local4
                    }

                    Local0 = (((Local1 << 0x04) & 0xF0) | (Local2 & 0x0F
                        ))
                    Local1 = ((Local2 & 0x0F) | 0xD0)
                    Notify (^^^PEG0.PEGP, Local1)
                    BBST = Local0
                }
                Else
                {
                    BBST = Zero
                }
            }

            Method (_Q52, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x52
                If ((NVBB & 0xFFFF))
                {
                    Local0 = BBST /* \_SB_.PCI0.LPCB.EC__.BBST */
                    Local1 = ((Local0 >> 0x04) & 0x0F)
                    Local2 = (Local0 & 0x0F)
                    Local3 = ((NVBB >> 0x08) & 0xFF)
                    Local4 = (NVBB & 0xFF)
                    If ((Local1 != Local3))
                    {
                        Local1 = Local3
                    }

                    Local5 = (Local3 + Local4)
                    Local5--
                    If ((Local2 > Local5))
                    {
                        Local2 = Local5
                    }

                    If ((Local2 < Local4))
                    {
                        Local2 = Local4
                    }

                    Local2++
                    If ((Local2 > Local5))
                    {
                        Local2 = Local5
                    }

                    Local0 = (((Local1 << 0x04) & 0xF0) | (Local2 & 0x0F
                        ))
                    Local1 = ((Local2 & 0x0F) | 0xD0)
                    Notify (^^^PEG0.PEGP, Local1)
                    BBST = Local0
                }
                Else
                {
                    BBST = Zero
                }
            }

            Method (_Q53, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x53
                ECTB = Zero
                ^^^^AC.ADJP (Zero)
            }

            Method (_Q54, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x54
                If (((PIM0 || PIM1) || (PIM2 || PIM3)))
                {
                    If (PIM0)
                    {
                        IMXW = PIM0 /* \PIM0 */
                        IMMK = One
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }

                    If (PIM1)
                    {
                        IMXW = PIM1 /* \PIM1 */
                        IMMK = 0x02
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }

                    If (PIM2)
                    {
                        IMXW = PIM2 /* \PIM2 */
                        IMMK = 0x04
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }

                    If (PIM3)
                    {
                        IMXW = PIM3 /* \PIM3 */
                        IMMK = 0x08
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }
                }
            }

            Method (_Q55, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x55
                If (((PIM0 || PIM1) || (PIM2 || PIM3)))
                {
                    If (PIM0)
                    {
                        IMXW = OIM0 /* \OIM0 */
                        IMMK = One
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }

                    If (PIM1)
                    {
                        IMXW = OIM1 /* \OIM1 */
                        IMMK = 0x02
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }

                    If (PIM2)
                    {
                        IMXW = OIM2 /* \OIM2 */
                        IMMK = 0x04
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }

                    If (PIM3)
                    {
                        IMXW = OIM3 /* \OIM3 */
                        IMMK = 0x08
                        PRM1 = 0x02
                        PRM0 = 0x0D
                        SSMP = 0xE0
                    }
                }
            }

            Method (_Q56, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x56
                If (^^^^WMI.HKDR)
                {
                    FDAT = 0xFF
                    FCMD = 0xD3
                    If ((FBUF == 0xAA))
                    {
                        Local0 = 0x64
                    }
                    Else
                    {
                        Local0 = 0x65
                    }

                    FBUF = Zero
                    ^^^^WMI.EVNT = Local0
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q57, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x57
                If (^^^^WMI.HKDR)
                {
                    NACT = One
                    ^^^^WMI.EVNT = 0x6F
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x58
                If (^^^^WMI.HKDR)
                {
                    NACT = Zero
                    ^^^^WMI.EVNT = 0x50
                    Notify (WMI, 0xD0) // Hardware-Specific
                    ECTB = Zero
                    ^^^^AC.ADJP (Zero)
                    If ((\_PR.CFGD & 0x00400000))
                    {
                        If (ADP)
                        {
                            IMXW = OIM1 /* \OIM1 */
                            IMMK = 0x02
                            PRM1 = 0x02
                            PRM0 = 0x0D
                            SSMP = 0xE0
                        }
                        Else
                        {
                            CIM1 = IMXW /* \IMXW */
                            IMXW = 0x5C
                            IMMK = 0x02
                            PRM1 = 0x02
                            PRM0 = 0x0D
                            SSMP = 0xE0
                            IMXW = CIM1 /* \CIM1 */
                        }
                    }
                }
            }

            Method (_Q59, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x59
                If (^^^^WMI.HKDR)
                {
                    NACT = One
                    ^^^^WMI.EVNT = 0x6D
                    Notify (WMI, 0xD0) // Hardware-Specific
                }
            }

            Method (_Q5A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x60
                If (^^^^WMI.HKDR)
                {
                    NACT = Zero
                    ^^^^WMI.EVNT = 0x6E
                    Notify (WMI, 0xD0) // Hardware-Specific
                    ECTB = Zero
                    ^^^^AC.ADJP (Zero)
                    If ((\_PR.CFGD & 0x00400000))
                    {
                        If (ADP)
                        {
                            IMXW = OIM1 /* \OIM1 */
                            IMMK = 0x02
                            PRM1 = 0x02
                            PRM0 = 0x0D
                            SSMP = 0xE0
                        }
                        Else
                        {
                            CIM1 = IMXW /* \IMXW */
                            IMXW = 0x5C
                            IMMK = 0x02
                            PRM1 = 0x02
                            PRM0 = 0x0D
                            SSMP = 0xE0
                            IMXW = CIM1 /* \CIM1 */
                        }
                    }
                }
            }
        }

        Device (PS2K)
        {
            Name (_HID, "MSFT0001")  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
            Name (_CRS, Buffer (0x16)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x60, 0x00, 0x60, 0x00, 0x01, 0x01,  // G.`.`...
                /* 0008 */  0x47, 0x01, 0x64, 0x00, 0x64, 0x00, 0x01, 0x01,  // G.d.d...
                /* 0010 */  0x23, 0x02, 0x00, 0x01, 0x79, 0x00               // #...y.
            })
            Name (_PRS, Buffer (0x10)  // _PRS: Possible Resource Settings
            {
                /* 0000 */  0x31, 0x00, 0x4B, 0x60, 0x00, 0x01, 0x4B, 0x64,  // 1.K`..Kd
                /* 0008 */  0x00, 0x01, 0x22, 0x02, 0x00, 0x38, 0x79, 0x00   // .."..8y.
            })
        }

        Device (PS2M)
        {
            Name (_HID, "MSFT0003")  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, Buffer (0x06)  // _CRS: Current Resource Settings
            {
                 0x23, 0x00, 0x10, 0x01, 0x79, 0x00               // #...y.
            })
            Name (_PRS, Buffer (0x08)  // _PRS: Possible Resource Settings
            {
                 0x31, 0x00, 0x22, 0x00, 0x10, 0x38, 0x79, 0x00   // 1."..8y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PSF0 & 0x0C))
                {
                    Return (Zero)
                }

                Return (0x0F)
            }
        }

        Device (SENM)
        {
            Name (_HID, EisaId ("STU0604"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CRS, Buffer (0x06)  // _CRS: Current Resource Settings
            {
                 0x23, 0x00, 0x10, 0x01, 0x79, 0x00               // #...y.
            })
            Name (_PRS, Buffer (0x08)  // _PRS: Possible Resource Settings
            {
                 0x31, 0x00, 0x22, 0x00, 0x10, 0x38, 0x79, 0x00   // 1."..8y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((PSF0 & 0x0C) == 0x04))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (ELNM)
        {
            Name (_HID, EisaId ("ETD0403"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, Buffer (0x06)  // _CRS: Current Resource Settings
            {
                 0x23, 0x00, 0x10, 0x01, 0x79, 0x00               // #...y.
            })
            Name (_PRS, Buffer (0x08)  // _PRS: Possible Resource Settings
            {
                 0x31, 0x00, 0x22, 0x00, 0x10, 0x38, 0x79, 0x00   // 1."..8y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((PSF0 & 0x0C) == 0x08))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }

        Device (SYNM)
        {
            Name (_HID, EisaId ("SYN1222"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, Buffer (0x06)  // _CRS: Current Resource Settings
            {
                 0x23, 0x00, 0x10, 0x01, 0x79, 0x00               // #...y.
            })
            Name (_PRS, Buffer (0x08)  // _PRS: Possible Resource Settings
            {
                 0x31, 0x00, 0x22, 0x00, 0x10, 0x38, 0x79, 0x00   // 1."..8y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((PSF0 & 0x0C) == 0x0C))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }
        }
    }

    Scope (_TZ)
    {
        Name (DETP, 0x37)
        Name (PATP, 0x5A)
        Name (CRTP, 0x9B)
        ThermalZone (TZ0)
        {
            Name (PPFG, Zero)
            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Local0 = \_SB.PCI0.LPCB.EC.TMP
                    If ((PSF0 & 0x02))
                    {
                        If (PPFG)
                        {
                            If ((Local0 <= (\_SB.PCI0.LPCB.EC.PSV - \_SB.PCI0.LPCB.EC.DTHL)))
                            {
                                \_SB.AC.ADJP (0x80000000)
                                PPFG = Zero
                            }
                        }
                        ElseIf ((Local0 >= \_SB.PCI0.LPCB.EC.PSV))
                        {
                            PPFG = One
                            \_SB.AC.ADJP (Zero)
                        }
                    }

                    Return (((Local0 * 0x0A) + 0x0AAC))
                }

                Return (((DETP * 0x0A) + 0x0AAC))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Return (0x0F5C)
                }

                Return (((CRTP * 0x0A) + 0x0AAC))
            }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS01)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (UPCN, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCN) /* \_SB_.PCI0.XHC_.RHUB.HS01._UPC.UPCN */
            }

            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS01._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (PLDN, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDN) /* \_SB_.PCI0.XHC_.RHUB.HS01._PLD.PLDN */
            }

            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00   // i.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS01._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS02)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS02._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00   // i.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS02._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS03)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS03._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x71, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00   // q.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS03._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS04)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x07, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS04._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x71, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00   // q.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS04._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS05)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (UPCN, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCN) /* \_SB_.PCI0.XHC_.RHUB.HS05._UPC.UPCN */
            }

            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS05._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (PLDN, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDN) /* \_SB_.PCI0.XHC_.RHUB.HS05._PLD.PLDN */
            }

            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x69, 0x0C, 0x80, 0x02, 0x00, 0x00, 0x00, 0x00   // i.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS05._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS06)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS06._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x68, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00   // h.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS06._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS07)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS07._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x70, 0x0C, 0x80, 0x03, 0x00, 0x00, 0x00, 0x00   // p.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS07._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS08)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS08._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x70, 0x0C, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00   // p.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS08._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS09)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS09._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS09._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS10)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS10._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS10._PLD.PLDP */
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS11))
    {
        Scope (_SB.PCI0.XHC.RHUB.HS11)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS11._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS11._PLD.PLDP */
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS12))
    {
        Scope (_SB.PCI0.XHC.RHUB.HS12)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS12._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS12._PLD.PLDP */
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS13))
    {
        Scope (_SB.PCI0.XHC.RHUB.HS13)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS13._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS13._PLD.PLDP */
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.HS14))
    {
        Scope (_SB.PCI0.XHC.RHUB.HS14)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HS14._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HS14._PLD.PLDP */
            }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.USR1)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.USR1._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.USR1._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.USR2)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.USR2._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.USR2._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS01)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (UPCN, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCN) /* \_SB_.PCI0.XHC_.RHUB.SS01._UPC.UPCN */
            }

            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS01._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (PLDN, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDN) /* \_SB_.PCI0.XHC_.RHUB.SS01._PLD.PLDN */
            }

            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00   // i.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS01._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS02)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS02._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00   // i.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS02._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS03)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS03._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x71, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00   // q.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS03._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS04)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x07, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS04._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x71, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00   // q.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS04._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS05)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (UPCN, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCN) /* \_SB_.PCI0.XHC_.RHUB.SS05._UPC.UPCN */
            }

            Name (UPCP, Package (0x04)
            {
                0xFF, 
                0x03, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS05._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            If ((^^^^RP05.PXSX.VID == 0x21421B21))
            {
                Name (PLDN, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDN) /* \_SB_.PCI0.XHC_.RHUB.SS05._PLD.PLDN */
            }

            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                    /* 0008 */  0x69, 0x0C, 0x80, 0x02, 0x00, 0x00, 0x00, 0x00   // i.......
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS05._PLD.PLDP */
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS06)
    {
        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        {
            Name (UPCP, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS06._UPC.UPCP */
        }

        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        {
            Name (PLDP, Package (0x01)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            })
            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS06._PLD.PLDP */
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SS07))
    {
        Scope (_SB.PCI0.XHC.RHUB.SS07)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS07._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS07._PLD.PLDP */
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SS08))
    {
        Scope (_SB.PCI0.XHC.RHUB.SS08)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS08._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS08._PLD.PLDP */
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SS09))
    {
        Scope (_SB.PCI0.XHC.RHUB.SS09)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS09._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS09._PLD.PLDP */
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC.RHUB.SS10))
    {
        Scope (_SB.PCI0.XHC.RHUB.SS10)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Name (UPCP, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SS10._UPC.UPCP */
            }

            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
            {
                Name (PLDP, Package (0x01)
                {
                    Buffer (0x10)
                    {
                        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                })
                Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SS10._PLD.PLDP */
            }
        }
    }

    Scope (_SB.PCI0.RP05.PXSX)
    {
        OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
        Field (PCFG, ByteAcc, NoLock, Preserve)
        {
            VID,    32
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((VID != 0xFFFFFFFF))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        Device (AHUB)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Device (SS01)
            {
                Name (_ADR, One)  // _ADR: Address
                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                {
                    Name (UPCP, Package (0x04)
                    {
                        0xFF, 
                        0x03, 
                        Zero, 
                        Zero
                    })
                    Return (UPCP) /* \_SB_.PCI0.RP05.PXSX.AHUB.SS01._UPC.UPCP */
                }

                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                {
                    Name (PLDP, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x01,  // ..r.....
                            /* 0008 */  0x61, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00   // a.......
                        }
                    })
                    Return (PLDP) /* \_SB_.PCI0.RP05.PXSX.AHUB.SS01._PLD.PLDP */
                }
            }

            Device (SS02)
            {
                Name (_ADR, 0x02)  // _ADR: Address
                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                {
                    Name (UPCP, Package (0x04)
                    {
                        0xFF, 
                        0x03, 
                        Zero, 
                        Zero
                    })
                    Return (UPCP) /* \_SB_.PCI0.RP05.PXSX.AHUB.SS02._UPC.UPCP */
                }

                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                {
                    Name (PLDP, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x01,  // ..r.....
                            /* 0008 */  0x71, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00   // q.......
                        }
                    })
                    Return (PLDP) /* \_SB_.PCI0.RP05.PXSX.AHUB.SS02._PLD.PLDP */
                }
            }

            Device (HS01)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                {
                    Name (UPCP, Package (0x04)
                    {
                        0xFF, 
                        0x03, 
                        Zero, 
                        Zero
                    })
                    Return (UPCP) /* \_SB_.PCI0.RP05.PXSX.AHUB.HS01._UPC.UPCP */
                }

                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                {
                    Name (PLDP, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x01,  // ..r.....
                            /* 0008 */  0x61, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00   // a.......
                        }
                    })
                    Return (PLDP) /* \_SB_.PCI0.RP05.PXSX.AHUB.HS01._PLD.PLDP */
                }
            }

            Device (HS02)
            {
                Name (_ADR, 0x04)  // _ADR: Address
                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                {
                    Name (UPCP, Package (0x04)
                    {
                        0xFF, 
                        0x03, 
                        Zero, 
                        Zero
                    })
                    Return (UPCP) /* \_SB_.PCI0.RP05.PXSX.AHUB.HS02._UPC.UPCP */
                }

                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                {
                    Name (PLDP, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x01,  // ..r.....
                            /* 0008 */  0x71, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00   // q.......
                        }
                    })
                    Return (PLDP) /* \_SB_.PCI0.RP05.PXSX.AHUB.HS02._PLD.PLDP */
                }
            }
        }
    }

    Scope (_SB.PCI0.SAT0)
    {
        OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
        Field (PCFG, ByteAcc, NoLock, Preserve)
        {
            Offset (0x9C), 
            Offset (0x9E), 
            SMS,    1
        }
    }

    Scope (_SB.PCI0.RP09.PXSX)
    {
        OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
        Field (PCFG, ByteAcc, NoLock, Preserve)
        {
            VID,    16, 
            DID,    16, 
            Offset (0x08), 
            RID,    8, 
            PI,     8, 
            SCC,    8, 
            BCC,    8
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((VID != 0xFFFF))
            {
                Return (0x0A)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.RP17.PXSX)
    {
        OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
        Field (PCFG, ByteAcc, NoLock, Preserve)
        {
            VID,    16, 
            DID,    16, 
            Offset (0x08), 
            RID,    8, 
            PI,     8, 
            SCC,    8, 
            BCC,    8
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((VID != 0xFFFF))
            {
                Return (0x0A)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0.RP21.PXSX)
    {
        OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
        Field (PCFG, ByteAcc, NoLock, Preserve)
        {
            VID,    16, 
            DID,    16, 
            Offset (0x08), 
            RID,    8, 
            PI,     8, 
            SCC,    8, 
            BCC,    8
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((VID != 0xFFFF))
            {
                Return (0x0A)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (_SB.WMI)
    {
        Method (PSTG, 0, Serialized)
        {
            If (^^PCI0.SAT0.SMS)
            {
                Return (One)
            }

            If ((^^PCI0.RP09.PXSX.VID != 0xFFFF))
            {
                If ((^^PCI0.RP09.PXSX.BCC == One))
                {
                    Switch (ToInteger (^^PCI0.RP09.PXSX.SCC))
                    {
                        Case (0x04)
                        {
                            If ((^^PCI0.RP09.PXSX.VID == 0x8086))
                            {
                                Return (One)
                            }
                        }
                        Case (0x06)
                        {
                            If ((^^PCI0.RP09.PXSX.PI == One))
                            {
                                Return (One)
                            }
                        }
                        Case (0x08)
                        {
                            If ((^^PCI0.RP09.PXSX.PI == 0x02))
                            {
                                Return (One)
                            }
                        }

                    }
                }
            }

            If ((^^PCI0.RP17.PXSX.VID != 0xFFFF))
            {
                If ((^^PCI0.RP17.PXSX.BCC == One))
                {
                    Switch (ToInteger (^^PCI0.RP17.PXSX.SCC))
                    {
                        Case (0x04)
                        {
                            If ((^^PCI0.RP17.PXSX.VID == 0x8086))
                            {
                                Return (One)
                            }
                        }
                        Case (0x06)
                        {
                            If ((^^PCI0.RP17.PXSX.PI == One))
                            {
                                Return (One)
                            }
                        }
                        Case (0x08)
                        {
                            If ((^^PCI0.RP17.PXSX.PI == 0x02))
                            {
                                Return (One)
                            }
                        }

                    }
                }
            }

            If ((^^PCI0.RP21.PXSX.VID != 0xFFFF))
            {
                If ((^^PCI0.RP21.PXSX.BCC == One))
                {
                    Switch (ToInteger (^^PCI0.RP21.PXSX.SCC))
                    {
                        Case (0x04)
                        {
                            If ((^^PCI0.RP21.PXSX.VID == 0x8086))
                            {
                                Return (One)
                            }
                        }
                        Case (0x06)
                        {
                            If ((^^PCI0.RP21.PXSX.PI == One))
                            {
                                Return (One)
                            }
                        }
                        Case (0x08)
                        {
                            If ((^^PCI0.RP21.PXSX.PI == 0x02))
                            {
                                Return (One)
                            }
                        }

                    }
                }
            }

            Return (Zero)
        }

        Method (PSLD, 1, NotSerialized)
        {
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS07)
    {
        Device (CAM0)
        {
            Name (_ADR, 0x07)  // _ADR: Address
            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
            {
                ToPLD (
                    PLD_Revision           = 0x2,
                    PLD_IgnoreColor        = 0x1,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x0,
                    PLD_Height             = 0x0,
                    PLD_UserVisible        = 0x0,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x1,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "CENTER",
                    PLD_Shape              = "UNKNOWN",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x0,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0,
                    PLD_VerticalOffset     = 0xFFFF,
                    PLD_HorizontalOffset   = 0xFFFF)

            })
        }
    }
}

