Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963D3C1405
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768789; cv=none; b=m9i9fX5s8a+74rFsRm6qDo1Eetl2dRS5leLrT6EG9i4yLLRT5SE94km8Up7PFEKg6P1yDB44XNLQk0yYsxpIsdKWNkcaXii4BUndV7FK+eS6rcNiOLTPqlkhGFZgzCuRwnyiqEfXYEu8pzTug90T5CtV8qED2BWjQpb/lq16d8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768789; c=relaxed/simple;
	bh=WRYkkhNFG2in0x4oQ0VhrcKlj2Eey1Y+NQGyFOqjXrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lU79zbDoevWXNfSM0eFHwzRnzMsQeplQGqH3D3jurYp9UhB3+HppxgoZE8a7PaJiR0lBq69cS2nWlLbihHgdFjNbWwUEHcTIHSQ6inN9M89VRKMPv0368hpj5zTjtQys3I1ILxK8meZr4s8FfTbxboMD+qZithcHePDJEjMEppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=oTVEsdDa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=x96usODN; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="oTVEsdDa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="x96usODN"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 524BA1D00774;
	Wed, 30 Sep 2026 07:46:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 30 Sep 2026 07:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790768785;
	 x=1790855185; bh=CZ9j04Gw3pK4YCyco4vP6qh7WM4mtlGm72AOxOzkrac=; b=
	oTVEsdDaWff4CFMDtsv4yzOfdAeaAK9xuf0jfTs2vLDkihH29wjR322mhr8VKjnD
	CoOKVY6evQ+tkhRx//NWww/1Nb6G1cPzK8m18eu+HNdnWbfpTvtHCsr0562lYSRX
	pCUaTS6GebyQlC0OI340Tl64BddNVkK1Q/L9rCpznIjoaLzyWvD8cz8L5WGnK4/m
	VjiY+qDgLGtjvST5j5eJWDvaIbNCuXCLLM26YZp/f5Yr8un6pGjuiKkL7o02CDkD
	r9z8+mRCj0XJneKy6+p8OWIHlNtI4B7f9yTfpVh2zIBCqywZqOb17v2USvJQY113
	fxic3E8FlH5yyyN7KdXwbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790768785; x=
	1790855185; bh=CZ9j04Gw3pK4YCyco4vP6qh7WM4mtlGm72AOxOzkrac=; b=x
	96usODNuYo2QAd1exnFLytCeHoOzQIYJWTJfr90TNkVXBR0HGcAAr0Q7FmT7q3FT
	i/CKXnml9rPNilM6VC56bm6UZ9hebuihBxwWJTXCqxf815fdSnCrdNFBzlQ4GlPS
	f6kXrllg98TL+xMnfeOPU9bLyC9NHscqCrA2DWxi16cXd62Di4aKezrHnmSwul3I
	simV9CtDQ3S+ilMRrkJXDqOj5V8nLR3TjG8fRHuIewB490UeLDh/eoUd1//AHRNZ
	dcgbykn2CLuSpPHzY9q4rVWvToWWHJCzaGvBEBMZjRMqkvrkELn/Ah78iL7wsbQr
	h9oPo2Dz2w/NGtq+RPmxQ==
X-ME-Sender: <xms:kPa8auaRlSWOsueAYrTiTADVxBojMnRARu1bjCED5dESkUs5CZGFVg>
    <xme:kPa8ao26nQdHMQgAvleY9nvxbeuP4L8NqIJ8FtIUxNRBYTLZ2VP65dI0q3gjYHkJS
    aWBn_qF0xqzlyM3lHByU6ursdRYEKmOS6pWc_0d2_Qq1Qpwk6h-MQ>
X-ME-Received: <xmr:kPa8amUkPWgtpwDWiuwytOoXN7AaYJu9dqU_GdNXXfGwbn3nkblhyHA0be4ZW9i8>
X-ME-Proxy-Cause: dmFkZTGRtfM5DOSIyxE1tRbamHwk4Jl2FFJJKkHoXyKddBV8w3KQ8MJh/GqevkEbxeUv7u
    YtVWdW26BF7zYjNUQjbpUkMct5IoJErgx/fNe8NsvRSGg2zxuH+a+zKFQIy0s4JZtU/c9a
    3ilkXXTq6Xl02AYOSnHAofAalaCR6zpFLtNVuZRZtv15niL/j0mRtcDMHuXQFCfxCowNNZ
    o2K/whc5ZaXsXINKwoRTtmcklCeKyZli9sC/7Q30/cGFBpA+Qqhwx08qPOnsp3TE9zb2ft
    ax7JcbWz5eBEZg7CDqqvVOkEaEtvkVcLWX4flM9qjO8Jc2D8yr24vnKNZxOSjyi2EI/3qM
    K5pJr65DrMBh2pm26rCNHHCAUtQZR3Vb/9Mh57iJrdmUopSk84mIwL2L1MDSknQPdDf+YF
    s4IR57AgRwkiXVIxdvOCAzAsfI44W97bOLfX0JKNg8p+EwrcJIHUn0NhpK+aWhQwHiO19Q
    hkU8c4IB7BsnUuwF/E75HKa80pRwpdS4vdzbIMkA6qOdtHcrW2otd3IR2h8F0S0LVZ27Gl
    6E+fOuREcPQA3Tl8//IhepxBOB0VSsAkZoRp1h+0Dq6bNWZm9nhiPXiHIDD2rsxCemRuaL
    nYkngDe6BzLDpea1+NlFeSaJgEzy0lbxAR5dxO84a2dIAVe3XgqBdigz3ySw
X-ME-Proxy: <xmx:kPa8aqXAoVxGrApgjhSnCo1yUgDxnVzqLflVHSEqB9g9iorZTwVRbA>
    <xmx:kfa8ate_cNwKVz9Q82k_pXWtVM9YjOivo_iYQu6CgSpyOB5szAVGqQ>
    <xmx:kfa8arVZIn9fsgCswBgy27thXlRRlsW1y09EdVWz5272PTqGSoyAJw>
    <xmx:kfa8aufZ5xRMZrsu8mpdHRHhr5E_99mMxVHz5hWGMSopWPEEtQNSyw>
    <xmx:kfa8aqSzkftm4awiIrh-460CPOg9AOwnFPBPXrDngOXmh1bcwRWblYTT>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 07:46:23 -0400 (EDT)
Message-ID: <bd083a37-8ac7-4730-8970-2744fa60a867@bsbernd.com>
Date: Wed, 30 Sep 2026 13:46:20 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] mount_service: refuse paths the user did not
 name
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
 <20260928-mount-service-bound-open-v2-3-0f9f501d05ce@bsbernd.com>
 <20260929022636.GC6253@frogsfrogsfrogs>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20260929022636.GC6253@frogsfrogsfrogs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/29/26 04:26, Darrick J. Wong wrote:
> On Mon, Sep 28, 2026 at 01:02:05PM +0200, Bernd Schubert via B4 Relay wrote:
>> From: Bernd Schubert <bernd@bsbernd.com>
>>
>> fuservicemount3 warns about a path that the user did not name on the
>> command line, but still opens it. A server can take a path in a form
>> that the helper cannot split, for example "-journal/dev/sdb1" or its
>> own option syntax. The administrator can now list such paths in
>> /etc/fuse.conf, per filesystem type:
>>
>>     service_open_path = ext4 /dev/sd*
>>
>> The pattern is matched with fnmatch() and FNM_PATHNAME, so "*" does not
>> match "/". A requested path with a "." or ".." component never matches,
>> because "*" matches "..", and "/dev/*" would then open "/". The helper
>> now refuses any other path with EPERM.
>>
>> Assisted-by: LLM
>> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
>> ---
>>  doc/fuservicemount3.8  | 16 ++++++++
>>  doc/mount.fuse3.8      |  7 ++++
>>  include/fuse_service.h |  4 +-
>>  test/test_fuser_conf.c | 55 ++++++++++++++++++++++++++++
>>  util/fuse.conf         | 11 ++++++
>>  util/fuser_conf.c      | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>  util/fuser_conf.h      |  3 ++
>>  util/mount_service.c   | 13 ++++---
>>  8 files changed, 202 insertions(+), 6 deletions(-)
>>
>> diff --git a/doc/fuservicemount3.8 b/doc/fuservicemount3.8
>> index aa2167cb4872..18e285c1ab29 100644
>> --- a/doc/fuservicemount3.8
>> +++ b/doc/fuservicemount3.8
>> @@ -19,6 +19,22 @@ Mount a filesystem using a FUSE server that runs as a socket service.
>>  These servers can be contained using the platform's service management
>>  framework.
>>  
>> +The FUSE server may ask fuservicemount3 to open files on its behalf.
>> +fuservicemount3 opens a path only in these cases:
>> +.IP \- 2
>> +The path is a command line argument, for example /srv/disk.img.
>> +.IP \- 2
>> +The path is the value in a key=value option, for example /dev/sdb1 in
>> +"-o journal_dev=/dev/sdb1".
>> +.IP \- 2
>> +The path directly follows a short option, for example /dev/sdb1 in
>> +"-J/dev/sdb1".
>> +.IP \- 2
>> +A service_open_path line in /etc/fuse.conf lists the path for the filesystem
>> +type.
>> +.PP
>> +It refuses any other request with EPERM.
>> +
>>  The second form checks if there is a FUSE service available for the given
>>  filesystem type.
>>  .SH "AUTHORS"
>> diff --git a/doc/mount.fuse3.8 b/doc/mount.fuse3.8
>> index 2e587458a06e..d55c96139d9f 100644
>> --- a/doc/mount.fuse3.8
>> +++ b/doc/mount.fuse3.8
>> @@ -38,6 +38,13 @@ Allow non-root users to specify the \fBallow_other\fP or
>>  \fBallow_root\fP mount options (see below).
>>  .TP
>>  These limits are enforced by the \fBfusermount3\fP helper, so they can be avoided by filesystems that run as root.
>> +.TP
>> +\fBservice_open_path = SUBTYPE PATTERN\fP
>> +Allow \fBfuservicemount3\fP(8) to open paths that match \fIPATTERN\fP for the
>> +server of a service mount of type \fBfuse.\fISUBTYPE\fR, in addition to the
>> +paths on the mount command line. \fIPATTERN\fP is an absolute path in which "*"
>> +does not match "/". A pattern that matches a directory gives the server every
>> +file below it. The line can be repeated.
>>  .SH OPTIONS
>>  Most of the generic mount options described in \fBmount\fP are
>>  supported (\fBro\fP, \fBrw\fP, \fBsuid\fP, \fBnosuid\fP, \fBdev\fP,
>> diff --git a/include/fuse_service.h b/include/fuse_service.h
>> index d6aedea8f0f8..2114e7772bf5 100644
>> --- a/include/fuse_service.h
>> +++ b/include/fuse_service.h
>> @@ -139,6 +139,8 @@ int fuse_service_parse_cmdline_opts(struct fuse_args *args,
>>  
>>  /**
>>   * Ask the mount.service helper to open a file on behalf of the fuse server.
>> + * The helper refuses a path that the mount command line does not name and
>> + * fuse.conf does not list; fuse_service_receive_file() then reports -EPERM.
>>   *
>>   * @param sf service context
>>   * @param path the path to file
>> @@ -153,7 +155,7 @@ int fuse_service_request_file(const struct fuse_service *sf, const char *path,
>>  
>>  /**
>>   * Ask the mount.service helper to open a block device on behalf of the fuse
>> - * server.
>> + * server.  The helper refuses the same paths as for a file request.
>>   *
>>   * @param sf service context
>>   * @param path the path to file
>> diff --git a/test/test_fuser_conf.c b/test/test_fuser_conf.c
>> index 4d974931cf58..6d95fe932039 100644
>> --- a/test/test_fuser_conf.c
>> +++ b/test/test_fuser_conf.c
>> @@ -105,6 +105,59 @@ static int test_trimmed_options(void)
>>  	return 0;
>>  }
>>  
>> +static int test_service_open_path(void)
>> +{
>> +	const char *test = "service_open_path";
>> +
>> +	if (write_conf("service_open_path = ext4 /dev/sd*\n"
>> +		       "service_open_path = ext4 /dev/nvme*\n"
>> +		       "service_open_path = ext4 relative/path\n"
>> +		       "service_open_path = xfs\t/srv/xfs.img\n"
>> +		       "service_open_path = xfs /srv/img/*\n"
>> +		       " \tservice_open_path = ext4 /srv/indented.img\n"
>> +		       "service_open_path =\x20\n"
>> +		       "service_open_path = ext4\n") == -1)
>> +		return fail(test, "could not write the config file");
>> +
>> +	read_conf(progname);
>> +
>> +	if (!service_open_path_listed("ext4", "/dev/sda"))
>> +		return fail(test, "/dev/sd* did not match /dev/sda");
>> +	if (!service_open_path_listed("ext4", "/dev/nvme0n1"))
>> +		return fail(test, "a second ext4 line was not recognised");
>> +	if (!service_open_path_listed("ext4", "/srv/indented.img"))
>> +		return fail(test, "an indented line was not recognised");
>> +	if (service_open_path_listed("ext4", "/dev/sda/x"))
>> +		return fail(test, "* matched a /");
>> +	if (service_open_path_listed("xfs", "/dev/sda"))
>> +		return fail(test, "an ext4 line matched for xfs");
>> +	if (service_open_path_listed("ext4", "relative/path"))
>> +		return fail(test, "a relative pattern was accepted");
>> +	if (!service_open_path_listed("xfs", "/srv/xfs.img"))
>> +		return fail(test, "a tab-separated line was not recognised");
>> +	if (!service_open_path_listed("xfs", "/srv/img/a.img"))
>> +		return fail(test, "/srv/img/* did not match /srv/img/a.img");
>> +	if (service_open_path_listed("xfs", "/srv/img/..") ||
>> +	    service_open_path_listed("xfs", "/srv/img/."))
>> +		return fail(test, "a . or .. component was accepted");
>> +	/* Either line, if stored, would match the empty path */
>> +	if (service_open_path_listed("", ""))
>> +		return fail(test, "a line without a subtype was accepted");
>> +	if (service_open_path_listed("ext4", ""))
>> +		return fail(test, "a line without a pattern was accepted");
>> +
>> +	if (write_conf("\n") == -1)
>> +		return fail(test, "could not write the config file");
>> +
>> +	read_conf(progname);
>> +
>> +	if (service_open_path_listed("ext4", "/dev/sda"))
>> +		return fail(test, "a line survived re-reading the config");
>> +
>> +	printf("PASS: %s\n", test);
>> +	return 0;
>> +}
>> +
>>  int main(void)
>>  {
>>  	char tempdir[] = "/tmp/test_fuser_conf.XXXXXX";
>> @@ -123,6 +176,8 @@ int main(void)
>>  		goto out_unlink;
>>  	if (test_trimmed_options())
>>  		goto out_unlink;
>> +	if (test_service_open_path())
>> +		goto out_unlink;
>>  
>>  	printf("All fuse.conf parser tests passed\n");
>>  	result = 0;
>> diff --git a/util/fuse.conf b/util/fuse.conf
>> index ab048e0347b2..2c182ffa9d6a 100644
>> --- a/util/fuse.conf
>> +++ b/util/fuse.conf
>> @@ -15,3 +15,14 @@
>>  # equals sign).
>>  
>>  #mount_max = 1000
>> +
>> +
>> +# service_open_path = <subtype> <pattern> - a FUSE server that runs as a socket
>> +# service may ask fuservicemount3 to open paths that match <pattern>, in
>> +# addition to the paths on the mount command line. <subtype> is the filesystem
>> +# type after "fuse.", <pattern> an absolute path in which "*" does not match
>> +# "/". The line can be repeated to allow different patterns and subtypes.
>> +# A pattern that matches a directory gives the server every file below it.
>> +
>> +#service_open_path = ext4 /dev/sd*
>> +#service_open_path = ext4 /dev/nvme*
>> diff --git a/util/fuser_conf.c b/util/fuser_conf.c
>> index 12688f6c42b7..5ec9d263ac2f 100644
>> --- a/util/fuser_conf.c
>> +++ b/util/fuser_conf.c
>> @@ -18,6 +18,7 @@
>>  #include <stdio.h>
>>  #include <stdlib.h>
>>  #include <errno.h>
>> +#include <fnmatch.h>
>>  #include <mntent.h>
>>  #include <unistd.h>
>>  #include <sys/fsuid.h>
>> @@ -35,6 +36,14 @@ int mount_max = 1000;
>>  static uid_t oldfsuid;
>>  static gid_t oldfsgid;
>>  
>> +struct service_open_path {
>> +	struct service_open_path *next;
>> +	char *subtype;
>> +	char *pattern;
>> +};
>> +
>> +static struct service_open_path *service_open_paths;
>> +
>>  // Older versions of musl libc don't unescape entries in /etc/mtab
>>  
>>  // unescapes octal sequences like \040 in-place
>> @@ -192,12 +201,100 @@ static void strip_line(char *line)
>>  		memmove(line, s, strlen(s)+1);
>>  }
>>  
>> +/*
>> + * Store one service_open_path line. For the line
>> + * "service_open_path = ext4 /dev/sd*", str is "ext4 /dev/sd*".
>> + */
>> +static void parse_service_open_path(const char *str, int linenum,
>> +				    const char *progname)
>> +{
>> +	/* <subtype> ends at the first blank */
>> +	const size_t subtype_len = strcspn(str, " \t");
>> +	const char *pattern = str + subtype_len;
>> +	struct service_open_path *entry;
>> +
>> +	/* The rest of the line is <pattern>, blanks inside it included */
>> +	pattern += strspn(pattern, " \t");
>> +	/* A relative pattern would depend on each user's working directory */
>> +	if (!subtype_len || pattern[0] != '/') {
>> +		fprintf(stderr,
>> +			"%s: invalid service_open_path in %s at line %i\n",
>> +			progname, FUSE_CONF, linenum);
>> +		return;
>> +	}
>> +
>> +	entry = calloc(1, sizeof(*entry));
>> +	if (entry) {
>> +		entry->subtype = strndup(str, subtype_len);
>> +		entry->pattern = strdup(pattern);
>> +	}
>> +	/* Going on without the line would refuse paths the admin allowed */
>> +	if (!entry || !entry->subtype || !entry->pattern) {
>> +		fprintf(stderr, "%s: failed to allocate memory\n", progname);
>> +		exit(1);
>> +	}
>> +
>> +	/* Order does not matter, the lookup checks every entry */
>> +	entry->next = service_open_paths;
>> +	service_open_paths = entry;
>> +}
>> +
>> +/* The config can be read more than once; drop the lines of the last read */
>> +static void free_service_open_paths(void)
>> +{
>> +	while (service_open_paths) {
>> +		struct service_open_path *entry = service_open_paths;
>> +
>> +		service_open_paths = entry->next;
>> +		free(entry->subtype);
>> +		free(entry->pattern);
>> +		free(entry);
>> +	}
> 
> Might want to null out service_open_paths here to avoid a UAF in case
> this function ever gets used anywhere other than exit.
> 
>> +}
>> +
>> +/* @return true if a path component is "." or "..", as in "/srv/img/.." */
>> +static bool has_dot_component(const char *path)
>> +{
>> +	const char *comp = path;
>> +
>> +	for (;;) {
>> +		const size_t len = strcspn(comp, "/");
>> +
>> +		if ((len == 1 && comp[0] == '.') ||
>> +		    (len == 2 && comp[0] == '.' && comp[1] == '.'))
>> +			return true;
>> +		if (!comp[len])
>> +			return false;
>> +		comp += len + 1;
>> +	}
>> +}
>> +
>> +bool service_open_path_listed(const char *subtype, const char *path)
>> +{
>> +	const struct service_open_path *entry;
>> +
>> +	/* "*" also matches "..", which reaches the parent directory */
>> +	if (has_dot_component(path))
>> +		return false;
>> +
>> +	for (entry = service_open_paths; entry; entry = entry->next)
>> +		if (!strcmp(entry->subtype, subtype) &&
> 
> Would you consider allowing "*" for the subtype in the config file?
> 
> e.g.
> 
> service_open_path = * /proc/cpuinfo
> 
> So that we could (say) allowlist things like /proc/pressure that would
> allow a fuse server to monitor memory stalls in the calling process'
> namespaces and perhaps drop its caches?
> 
> (I don't know if PSI info is really useful for anyone, it's just a
> thought I had while reading this patch.)

Oh PSI can be really handy if you have your own cache and want to act on
system pressure. Although PSI then slows down your fuse-server, better
to have polling on cgroup memory memory usage and to start to reduce
your own cache before PSI kicks in and PSI high limit then as last
enforcement.

> 
> The code changes look good to me, modulo that question above. :)

Allowing subtype * sounds good to me, added in.


Thanks,
Bernd
