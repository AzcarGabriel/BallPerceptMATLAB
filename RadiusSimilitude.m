function value = RadiusSimilitude(AproximatedRadius, Radius, tolerance)
if abs(AproximatedRadius - Radius) <= tolerance
    value = true;
else
    value = false;
end
end

