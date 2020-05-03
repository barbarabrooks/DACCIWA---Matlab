function [flag_angle, flag_rate] = add_table_flag(lat, RPY, rate_RPY)

flag_angle = ones(length(lat),3);
flag_rate = ones(length(lat),3);

%angles
ix = find( (sqrt(RPY.^2) > 1) & (sqrt(RPY.^2) < 2) );%falg 2
if ~isempty(ix)
    flag_angle(ix) = 2;
end
clear ix

ix = find( (sqrt(RPY.^2) > 2) & (sqrt(RPY.^2) < 3) );%falg 3
if ~isempty(ix)
    flag_angle(ix) = 3;
end
clear ix

ix = find( (sqrt(RPY.^2) > 3) & (sqrt(RPY.^2) < 4) );%flag 4
if ~isempty(ix)
    flag_angle(ix) = 4;
end
clear ix

ix = find( (sqrt(RPY.^2) > 4) & (sqrt(RPY.^2) < 5) );%flag 5
if ~isempty(ix)
    flag_angle(ix) = 5;
end
clear ix
ix = find( (sqrt(RPY.^2) > 5)); %flag 6
if ~isempty(ix)
    flag_angle(ix) = 6;
end    
clear ix

%rates
ix = find( (sqrt(rate_RPY.^2) > 0.5) & (sqrt(rate_RPY.^2) < 1) );
if ~isempty(ix)
    flag_rate(ix) = 2;
end    
clear ix

ix = find( (sqrt(rate_RPY.^2) > 1) & (sqrt(rate_RPY.^2) < 1.5) );
if ~isempty(ix)
    flag_rate(ix) = 3;
end    
clear ix

ix = find( (sqrt(rate_RPY.^2) > 1.5) & (sqrt(rate_RPY.^2) < 2) );
if ~isempty(ix)
    flag_rate(ix) = 4;
end    
clear ix

ix = find( (sqrt(rate_RPY.^2) > 2) & (sqrt(rate_RPY.^2) < 2.5) );
if ~isempty(ix)
    flag_rate(ix) = 5;
end    
clear ix

ix = find( (sqrt(rate_RPY.^2) > 2.5));
if ~isempty(ix)
    flag_rate(ix) = 6;
end    
clear ix
