function A = sample_matrix(m_size, percentage_filled)
total = m_size(1) * m_size(2);

nonzero_entries = floor(percentage_filled * total);
A = zeros(total, 1);
A(randsample(total, nonzero_entries)) = 1;

A = reshape(A, m_size(1), m_size(2));
end
