program shootME

use nrtype
use ifc_newt
use ifc_integr
use f95_lapack, only: LA_GEES
use ifc_util
use ifc_rpo_ks

implicit none

include "fftw3.f"

real(dp), dimension(:), allocatable :: v,vdum, bc
complex(dpc), dimension(:),allocatable :: a,adum
real(dp), dimension(:), allocatable :: aIn
complex(dpc), dimension(:), allocatable :: ai,af
integer(i8b) :: invplan, plan ! needed by fftw3
integer(i4b) :: d, k,i
real(dp) :: T,kappa, ti,tf
real(dp) :: tolbc,tolf,damp=13.0_dp
integer(i4b) :: ntrial

open(21,file='parameters.dat')
	read(21,*)
	read(21,*) d
	read(21,*)
	read(21,*) L 
	read(21,*)
	read(21,*) tolbc
	read(21,*)
	read(21,*) tolf
	read(21,*)
	read(21,*) ntrial
	read(21,*) 
	read(21,*) Nsteps
	read(21,*) 
	read(21,*) Nplt
	read(21,*)
	read(21,*) M
	read(21,*)
	read(21,*) R
close(21)

221 Format(<d>F21.16)
222 Format(<d/2+1>F21.16)
223 Format(<4>F21.16)

allocate(v(d),vdum(d),bc(d))
allocate(a(d/2+1),adum(d/2+1),ai(d/2+1),af(d/2+1))
allocate(aIn(d/2))

aIn=0.0_dp

open(19,file='rpoGuess.dat')
 
	read(19,*) v(1:d)
 
close(19)

open(20,file='periodsGuess.dat')
 
	read(20,*) T
	read(20,*) kappa
 
close(20)


call dfftw_plan_dft_r2c_1d(plan,d,v,a,FFTW_ESTIMATE)
call dfftw_execute(plan)
call dfftw_destroy_plan(plan)
a=a/size(v)

bc(1:d/2)=real(a(2:size(a)))
bc(d/2+1:d)= aimag(a(2:size(a)))

call mnewtRPO(ntrial,bc,tolbc,tolf,T,kappa,ksFJ)

print *,"T",T,"kappa",kappa

open(27,file='periods.dat')
	write (27,"(F20.15)") T
	write (27,"(F20.15)") kappa
close(27)

a=(0.0_dp,0.0_dp)
a(2:size(a))=bc(1:size(bc)/2)+ii*bc(size(bc)/2+1:size(bc))

adum=a

call dfftw_plan_dft_c2r_1d(invplan,d,a,v,FFTW_ESTIMATE)
call dfftw_execute(invplan)
call dfftw_destroy_plan(invplan)

open(28,file='rpo.dat')
	write(28,222) v
close(28)


end program