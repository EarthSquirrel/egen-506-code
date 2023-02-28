function [Kaa, Kau, Kuu] = disassembleK(K, BC, L)
    Kaa = K(BC(:,1), BC(:,1));
    Kau = K(BC(:,1), L(:,1));
    Kuu = K(L(:,1), L(:,1));
end