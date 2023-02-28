function [Node, Elem, BC, Load] = readTruss(file)
% read from a file and output the nodal coordinates, element connectivity and properties, boundary conditions, and external loads
% file: a string filename, e.g. 'P3_10.txt'
% Node: a Nx1/(2)/{3} array giving the <x,(y),{z}> coordinates of each node
% Elem: a Mx5 array giving the <element type, 2 connecting node #'s, cross sectional area, Young's Modulus>
% BC: the known boundary conditions, a Rx2 array giving the <DOF #, displacement>
% Load: the known external loads, a Sx2 array giving the <DOF #, force>
%	R+S = DOF*N (the total number of defined conditions must equal the number of nodes by the degrees of freedom)
    N = importdata(file);
    E = importdata(file, ' ', size(N.data,1)+2);
    B = importdata(file, ' ', size(N.data,1)+size(E.data,1)+3);
    L = importdata(file, ' ', size(N.data,1)+size(E.data,1)+size(B.data,1)+4);
    Node = N.data;
    Elem = E.data;
    BC = B.data;
    Load = L.data;
    clear N E B L
end