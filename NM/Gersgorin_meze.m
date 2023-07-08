function [bounds] = Gersgorin_meze(A)

center=diag(A);
radius=sum(abs(A),2)-abs(center);
lower_bound=min(center-radius);
upper_bound=max(center+radius);
bounds=[lower_bound,upper_bound];

end

