Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D42481FDA;
	Wed,  1 Jul 2026 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908649; cv=none; b=VSVAFDs96tqg/DE3BaR6/C59va4osv+m/fjt2Jzunh+9/bwlz/qaB/c5LgHVErI23mQmK6CvHMqcuRQUanjGhBw90MdaOdQDt+2YM3JQKxFT4cytu4YN3dlbmhGS6Vyka9rpQdGHMeYkhcGScZqSeMWfSCNOXlWf22UGJCK9dF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908649; c=relaxed/simple;
	bh=c1px3BoNGuxLFplxDgYtxnF1ppMrAA3za8inQb8gA3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pSA/f/7j4Unwxf8uVLQ+W78uu9/MSP/4i7eU/AvUXpHd//b1RR6guSTion9splsc9JuVTkdtcncwDmCFCDY4RoFLG/E20563OZ1kEh67ALZyPQacVhZgDkaxDyUfMoeb6MtJxH95TR4P7hUHkNRvPu/dVt5DBwaGk2P3PfSO7JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Rpaf4R2L; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Rpaf4R2L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JjK8IopPFO69gYu4d7AuS3t2FChyiNkjOZ9bGDcqN6k=; b=Rpaf4R2LpBKkwOSZaarJDT8aAQ
	XwMIwfbzM+453NzjWcZpdyxAC+9GR0C9gXavCBs7gT3sj5c5QiaoGJ1c8L2ptoS5aT6IwJIk4RKPH
	ypjrI1EG4s4Fe3UbupdzdRVC0teyh7daxdLSVxdwodT4hUv/RimFSVOwp5EUj4eiLdJI7/SAP8AkO
	kTKxfGt3Ilzx+hUrmkA1WGdCBIO53lvzYkBI5pc6EKCr5ThwyhPK9j4REATjukuS8snglgzsspDsd
	uL9jFvFIHhZkxglcxQ64bpHLXArwP/S3c70r+iTmyyVHrfyrfwxgsuSDwxej3ZtsCfpWSqD+ux5m/
	N1xoZEcA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wetyy-007YUL-NL; Wed, 01 Jul 2026 14:24:00 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  Matt Harvey <mharvey@jumptrading.com>,
  kernel-dev@igalia.com,  Seth Forshee <sforshee@kernel.org>,  Christian
 Brauner <brauner@kernel.org>,  Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
In-Reply-To: <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
	(Amir Goldstein's message of "Wed, 1 Jul 2026 13:41:22 +0200")
References: <20260701110052.5309-1-luis@igalia.com>
	<CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
Date: Wed, 01 Jul 2026 13:24:11 +0100
Message-ID: <87pl16c2z8.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01 2026, Amir Goldstein wrote:

> On Wed, Jul 1, 2026 at 1:05=E2=80=AFPM Luis Henriques <luis@igalia.com> w=
rote:
>>
>> When setting an ACL in an inode we can immediately add it to the cache.
>> This is a small optimisation, as currently an ACL is only added to the
>> cache when reading it again, which involves an extra GETXATTR hop into
>> user-space.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  fs/fuse/acl.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
>> index 31fb50e16aed..c2584bb75ec7 100644
>> --- a/fs/fuse/acl.c
>> +++ b/fs/fuse/acl.c
>> @@ -155,6 +155,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct den=
try *dentry,
>>                  */
>>                 forget_all_cached_acls(inode);
>>                 fuse_invalidate_attr(inode);
>> +               if (!ret)
>> +                       set_cached_acl(inode, type, acl);
>
> This is undoing what forget_all_cached_acls() explicitly tries to do.
> I think the reason is that kernel code cannot assume the server did
> not modify ACL before storing them, not sure, but NFS does the same thing
> with nfs_zap_acl_cache().

In my understanding, forget_all_cached_acls() is cleaning any previously
cached ACLs (even if the SETXATTR failed!).  So it made sense to me to
cache the new ACL just like other filesystems seem to be doing.

On the other hand, having a server modifying the ACL without notifying the
kernel didn't sound right to me, specially because it has explicitly set
the FUSE_POSIX_ACL flag -- otherwise this code wouldn't be executed.  And
that's why I assumed it would be acceptable to have this optimisation:
because user-space asked the VFS to do permission checking *and* caching
ACLs.

I did actually took a look into the NFS code, but it seems to be doing it's
own ACL caching. But yeah, I can't claim to have fully understood what
(and why) NFS is really doing :-)

Cheers,
--=20
Lu=C3=ADs
