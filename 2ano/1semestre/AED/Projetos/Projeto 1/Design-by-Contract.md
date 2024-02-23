# Design-by-Contract

This project follows "Design-by-Contract" principles.
This is quite different from the "defensive programming" style
you may have seen elsewhere.
So, it is important that you understand these principles.

Design-by-contract prescribes that each function may REQUIRE that certain conditions are satisfied when it is called:
these are called PRECONDITIONS of the function and define the domain of
the function: the range of valid parameter values.
The caller is responsible for ensuring the preconditions before calling
the function, but that does not necessarily lead to extra work.
The benefit is that the called function can assume these conditions and
so needs not worry about parameters outside the domain.
Because of this, there is no need for invalid arguments error codes.
However, the function might (and should) check preconditions using
assert() clauses in the preamble of the function.
Should one of these assertions fail during testing, this would mean that
there is a bug in the caller.

On the other hand, each module function may ENSURE certain conditions on
its result, (provided it was called with valid preconditions): these are
called POSTCONDITIONS.
Ensuring the postconditions is a burden on the function, but should
benefit the caller, which may rely on these conditions for subsequent
operations (sometimes avoiding extra verifications).
The function may also use assert() clauses right before the return
statement to check postconditions.
Should one of these postconditions fail during testing, the bug is in the
function itself.

Assertions provide very useful function documentation, and are a great aid
during testing.
When we are confident that the program is correct, we may compile
a final version with disabled assertions, for improved efficiency.
This is accomplished by defining the macro symbol NDEBUG.
See 'man assert' for more details.
 
You may search the web to learn more about design-by-contract.

## Dealing with external errors

Design-by-contract eliminates repetitive checking and propagating of errors
that can predicted and thus avoided by the programmer _a priori_.
Unfortunately, errors related to memory allocation, file and device I/O,
and some others, are unpredictable to the programmer.
Also, many standard libraries adopt a defensive style and this inevitably
contaminates the code that uses those libraries, to some point.

To deal with these, defensive measures are required.
The programmer will have to check the error status of the operations,
and cleanup and propagate the error or report and fail.
