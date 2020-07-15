provider python {
	probe function__entry(const char *, const char *, int);
	probe function__return(const char *, const char *, int);
};

#pragma D attributes Evolving/Evolving/Common provider python provider
#pragma D attributes Private/Private/Common provider python module
#pragma D attributes Private/Private/Common provider python function
#pragma D attributes Evolving/Evolving/Common provider python name
#pragma D attributes Evolving/Evolving/Common provider python args
