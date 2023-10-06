
#include "libft.h"

/*
** returns 0 if the input is a prime
*/

unsigned int	ft_is_prime(int nbr)
{
	unsigned int	i;

	if (nbr <= 0)
		return (1);
	i = 2;
	while (i < (unsigned int)nbr)
	{
		if ((unsigned int)nbr % i == 0)
			return (1);
		i++;
	}
	return (0);
}