This is an evolved version of the Microsimplez CPU (https://opencores.org/projects/usimplez). Specifically, we have added a series of Error Correction Codes to protect the memory against faults.

The Error Correction Codes implemented are:

    SEC-2bBED: ECC able to correct one single bit in error, or to detect two adjacent bits in error (SEC-2bBED: Single Error Correction – 2-bit Burst Error Detection) with 8-parity bits for 16-data bits;
    
    2bBEC-3bBED: ECC able to correct single errors (one bit), 2-adjacent bits in error; or to detect 3-bit burst errors (2bBEC-3bBED: 2-bit Burst Error Correction – 3-bit Burst Error Detection) with 8-parity bits for 16-data bits;
    
    3bBEC-4bBED: ECC able to correct single errors (one bit), 2-adjacent and 3-adjacent bits in error; or to detect 4-bit burst errors (3bBEC-4bBED: 3-bit Burst Error Correction – 4-bit Burst Error Detection) with 8-parity bits for 16-data bits.
    
    BCH: With 10-redundant bits for 16-data bits, this ECC can correct 2-random bits in error.
    
    FUEC-QUAEC: With 9-redundant bits for 16-data bits, this ECC is able to correct an error in a single bit, or an error in two adjacent bits (2-bit burst errors) or a 3-bit burst error or a 4-bit burst error. More info about this ECC can be seen in J. Gracia-Morán, L. J. Saiz-Adalid, D. Gil-Tomás and P. J. Gil-Vicente, "Improving Error Correction Codes for Multiple-Cell Upsets in Space Applications," in IEEE Transactions on Very Large Scale Integration (VLSI) Systems, vol. 26, no. 10, pp. 2132-2142, Oct. 2018, doi: 10.1109/TVLSI.2018.2837220
    
    Adaptive-ECC: System that has divided the RAM in four zones, applying a different ECC to each zone.

More info (in spanish) about the work done with these ECC can be found in: J. Gracia-Morán, L.J. Saiz-Adalid, J.C. Baraza-Calvo, D. Gil-Tomás, P.J. Gil-Vicente, "A Proposal of an ECC-based Adaptive Fault-Tolerant Mechanism for 16-bit data words", Submitted to IEEE Latin American Transactions.
