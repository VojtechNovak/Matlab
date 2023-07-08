t = (-3*pi:0.01:3*pi)'; 
% Start with all zeros: 
unitstep = cos(t); 
% But make everything corresponding to t>=1 one:
unitstep(t>=pi) = -2; 
unitstep(t<=-pi) = -2;
plot(t,unitstep,'b','linewidth',3) 
hold on
box off