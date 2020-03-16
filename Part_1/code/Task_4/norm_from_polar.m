function x_vec = norm_from_polar(n)

    omega_vec = exp_rnd(0.5, n);
    phi_vec = rand(n,1) * 2*pi;
    x_vec = omega_vec.^(1/2) .* sin(phi_vec);
    
end