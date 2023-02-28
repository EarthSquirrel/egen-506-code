function [U, F, eps, sig] = FEAsolver(file)
% [U,F, strain, stress] = FEAsolver(file)
% Solves a 1D spring/bar problem and returns the displacements, forces,
% strains, and stresses from the problem definition
% ex. FEAsolver('P2_2.txt')
%
% reads in 'file' and exports all:
% U: displacements
% F: forces
% eps: strains
% sig: stresses

    % read in beam data from 'file', output Nodes (N), Elements (E),
    % Boundary conditions (B), Load conditions (L)
    [N,E,B,L] = readTruss(file); 
    % assign additional properties to the elements, such as element length
    % to not require calculating multiple times
    E_prop = elem_properties(N, E);
    
    % create vectors for displacement, force, strain, and stress
    U = nan(size(N,1),1); 
    F = nan(size(N,1),1);  
    U(B(:,1)) = B(:,2); % assigning known displacements
    F(L(:,1)) = L(:,2); % assigning known forces

    % assemble global stiffness matrix
%     [K_g] = assembleStiffness(N, E, E_prop);
    
    % perform row and column swaps to produce partitioned matrices
    [Kaa, Kau, Kuu] = disassembleK(K_g, B, L);
    
    % solve for unknown nodal displacements and forces
    U(L(:,1)) = Kuu^-1*(L(:,2) - Kau'*B(:,2));
    F(B(:,1)) = Kaa*U(B(:,1)) + Kau*U(L(:,1));
    
    % solve for stress and strain of the elements
%     [sig,eps] = stressStrain(N, E, U, F, E_prop);

end   
