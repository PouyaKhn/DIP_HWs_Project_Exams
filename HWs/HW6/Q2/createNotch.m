%**************************************************************************
% This is 'createNotch' function for part a of question 2                 *
% In this function we produce 6 HP butterworth filter in suitable places  *
% and make multiple notch filter with them                                *
%                                                                         *
% Inputs:  Dks and Dls: distance matrixes of btw filters                  *
%          D0: cut-off frequency                                          *
%                                                                         *
% Outputs: multipleNotch: notch filter that we create with some HF filters*
%**************************************************************************
function multipleNotch = createNotch(Dk1,Dl1,Dk2,Dl2,Dk3,Dl3,D0)
    
     Hk1 = 1./(1+(D0(1)./Dk1).^2);
     Hl1 = 1./(1+(D0(1)./Dl1).^2);
     
     Hk2 = 1./(1+(D0(2)./Dk2).^2);
     Hl2 = 1./(1+(D0(2)./Dl2).^2);
     
     Hk3 = 1./(1+(D0(3)./Dk3).^2);
     Hl3 = 1./(1+(D0(3)./Dl3).^2);
     
     multipleNotch = Hk1 .* Hl1 .* Hk2 .* Hl2 .* Hk3 .* Hl3;
end

