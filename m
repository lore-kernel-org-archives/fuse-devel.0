Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485B46AEFA;
	Thu,  2 Jul 2026 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982589; cv=none; b=SD+SPa6ui+T4fsJPraPrLdMrywH6bRsbvIxr5U3snllv7hzpb6hzJfWvsBifM6ZcFIBrwiPxaxR1hiMk/652fNdoGKBzZa6wvcO1T1WwZBIHsHAXsKfSfg9kW6n7xO+q6BX99MbmY+90lHalld9MYgEzfU2QPcmS+cGrgjEEnQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982589; c=relaxed/simple;
	bh=zCQGbb3v6hPJca3hNSpqCULPZHWr6C8/g80w8rBF7lI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QXlTLP67WiLno2Zqs1i05ssMM1YwuG1a/Cvkhidu9Gjil0OgN6iuzqMbLJoDdt6qXvvinN8SEMhvVsSUKC/YybraBjXQ5H/HLKwYStaK4ne9uYzzQPp56cAvmC8I0AIyd+T222kLdcchYdiuQOgwcqyZ1AFd5dS6wcj0rKNKhug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BrU8GB62; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BrU8GB62"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=x9soAUTPa/wKgiT8erCsVBuMg2+SomZZrD3guTtfBn0=; b=BrU8GB62NgnaZck/VEosTE5d+w
	qOGTsnCwuUtGUgK3cc5JkatJgMbS0QJCKyzk3AykFw04aiP3mQtAOoGbZj7ZStLEnD5uXLrdQVkuE
	r+5l6YQw2Kvpoxueypo/dmcXuEPtH2G0jg7PHVOFF81Ki4Fa3Hv4e4OrwFxBjYC/ok64SOLbsaWB6
	MhlJllVZvjAolVHxV+n6fB3piG8S+lxQitRtPj1GwNqvJQzU4wmvnsrkeaZxq6Ic8ZJ4PkzX8jnfm
	X2lTW+BIeUrQ5+RqE+OfWHBJunQe4lvbeo5uCtGeY8bZnPH+l0BqVWxyB2k2bk4nzpwAiLUnHwnLJ
	I9zCGWZw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wfDDI-007wgh-DS; Thu, 02 Jul 2026 10:56:04 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  Matt Harvey <mharvey@jumptrading.com>,
  kernel-dev@igalia.com,  Seth Forshee <sforshee@kernel.org>,  Christian
 Brauner <brauner@kernel.org>,  Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
In-Reply-To: <CAOQ4uxg-LcCp5_2OGFo71ejJEPc14uL_D6n04jwy3C2GuoWy7g@mail.gmail.com>
	(Amir Goldstein's message of "Thu, 2 Jul 2026 00:58:40 +0200")
References: <20260701110052.5309-1-luis@igalia.com>
	<CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
	<87pl16c2z8.fsf@wotan.olymp>
	<CAOQ4uxg-LcCp5_2OGFo71ejJEPc14uL_D6n04jwy3C2GuoWy7g@mail.gmail.com>
Date: Thu, 02 Jul 2026 09:56:09 +0100
Message-ID: <87o6gp7ot2.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02 2026, Amir Goldstein wrote:

> On Wed, Jul 1, 2026 at 2:24=E2=80=AFPM Luis Henriques <luis@igalia.com> w=
rote:
>>
>> On Wed, Jul 01 2026, Amir Goldstein wrote:
>>
>> > On Wed, Jul 1, 2026 at 1:05=E2=80=AFPM Luis Henriques <luis@igalia.com=
> wrote:
>> >>
>> >> When setting an ACL in an inode we can immediately add it to the cach=
e.
>> >> This is a small optimisation, as currently an ACL is only added to the
>> >> cache when reading it again, which involves an extra GETXATTR hop into
>> >> user-space.
>> >>
>> >> Signed-off-by: Luis Henriques <luis@igalia.com>
>> >> ---
>> >>  fs/fuse/acl.c | 2 ++
>> >>  1 file changed, 2 insertions(+)
>> >>
>> >> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
>> >> index 31fb50e16aed..c2584bb75ec7 100644
>> >> --- a/fs/fuse/acl.c
>> >> +++ b/fs/fuse/acl.c
>> >> @@ -155,6 +155,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct =
dentry *dentry,
>> >>                  */
>> >>                 forget_all_cached_acls(inode);
>> >>                 fuse_invalidate_attr(inode);
>> >> +               if (!ret)
>> >> +                       set_cached_acl(inode, type, acl);
>> >
>> > This is undoing what forget_all_cached_acls() explicitly tries to do.
>> > I think the reason is that kernel code cannot assume the server did
>> > not modify ACL before storing them, not sure, but NFS does the same th=
ing
>> > with nfs_zap_acl_cache().
>>
>> In my understanding, forget_all_cached_acls() is cleaning any previously
>> cached ACLs (even if the SETXATTR failed!).  So it made sense to me to
>> cache the new ACL just like other filesystems seem to be doing.
>
> Local filesystems do, remote filesystems not always.

True.  Even ceph, which is the remote filesystem I'm most familiar with,
caches ACLs when setting them only if the client has the right
capabilities for doing so.

>> On the other hand, having a server modifying the ACL without notifying t=
he
>> kernel didn't sound right to me, specially because it has explicitly set
>> the FUSE_POSIX_ACL flag -- otherwise this code wouldn't be executed.  And
>> that's why I assumed it would be acceptable to have this optimisation:
>> because user-space asked the VFS to do permission checking *and* caching
>> ACLs.
>
> Your arguments make sense to me.
> Only it appears so simple so it feels like I am missing something.
> Why wasn't this implemented like that in the first place?

Yeah, maybe your right, maybe I'm missing something as well and there is a
good reason for not doing it.

I was going to CC Christian, but I see you did that already :-)

Maybe he remembers the reasons behind this while working on commit
facd61053cff ("fuse: fixes after adapting to new posix acl api").

Cheers,
--=20
Lu=C3=ADs
