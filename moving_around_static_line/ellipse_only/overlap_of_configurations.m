function overlap = overlap_of_configurations(c1, c2)

angle_from_real_axis = angle(c1(1,1)) + pi/2; % we add 90' because we want to project on line *normal* to this line

aligned_with_real_axis1 = rotation(-angle_from_real_axis) * c1;
aligned_with_real_axis2 = rotation(-angle_from_real_axis) * c2;


line1 = line_from_configuration(aligned_with_real_axis1);
line2 = line_from_configuration(aligned_with_real_axis2);


interval1 = [min(real(line1)), max(real(line1))];
interval2 = [min(real(line2)), max(real(line2))];

overlap = abs(intervals_overlap(interval1, interval2)); 

end
