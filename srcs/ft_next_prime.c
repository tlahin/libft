
#include "libft.h"

unsigned int	ft_next_prime(int nbr)
{
	nbr++;
	if (ft_is_prime(nbr) == 1)
	{
		while(ft_is_prime(nbr))
			nbr++;
	}
	return ((unsigned int)nbr);
}