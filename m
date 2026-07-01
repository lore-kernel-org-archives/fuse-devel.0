Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E7D3CB2C7
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 22:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946735; cv=pass; b=ZzamyX9Hcuo/YUleZ+SqQa5wOkzkHVDAlopb3UjTSqyC8MEKinCbRh5cuP52jmSD4RC6r1sgEqqVgXVdiWITVkrQBi6MjXLK4+/0Nuwc82dRmU/rZnWehHPDTQ7KVfljGQL87ZP4gFckwVPcEkUWMvKxiERIcNDuAbuMCXSTWd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946735; c=relaxed/simple;
	bh=3es8E9RSb1sSxeJ5MBEoHUb6Ok5Ub7RBslJREOFWqnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/tBd2nf1lnrZNUPHXfWldV/ToqEp4yFDDB0UgcbtjLC9Rdl1Mc9LRfz+aPOxGYKjAdroz6YHJUyPlx3hbUQVHO32nw7aZ5CwwrO03bOLNm/06g1rzALqM9+iCEFSKxqgPa4mTuaveQlFNLu5mAHtzWNkLmzbuNT1zfFVrllXjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxR1+bFi; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxR1+bFi"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c12758e75afso197863166b.1
        for <fuse-devel@lists.linux.dev>; Wed, 01 Jul 2026 15:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782946732; cv=none;
        d=google.com; s=arc-20260327;
        b=phpMcF7VCQ/hDJ8hFy9gjTLNFwvUx7ZCon+yL37lah5muA0C4WNnjV9be057qgpXfl
         03JhKIsF9m8yEoMBkq1pqojy+6zuWkreLu/ORnhAQC6gaBPTcMkYViv2qCa5DKVu7yFY
         SOi5dMH+X9RR6HycFewIpzTNTkSsqr2rS+P+qzbgaC+mg12OseLs9EX00JuX+Zg3bWiK
         rAJH++lGSeNg6kfETDq8St268ib6X/IzZYKZPcHml6NWRcCocvWv8jYYqd0H5n/LDnmW
         1bp4yf0x6b01scYPodDOAPbRhQ/mycdoVC7RmO0RXmfIAJX2G3i1CCKUwhdXSsnnnBvN
         60+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CCniczWZOyEeV0Ge6Nxh39xIY2urrQQ0Ui12ykaN+J8=;
        fh=qrqgSCSVwYy9F+JRoXnzoHTcA1AqNSPbMpvV17zm6Bs=;
        b=Q62FORHP3qWiksV+POxWYPZEq4qoQiBh6wvSk4QuK6B2NvlZCpGqwIW+Gs2Q8Yj3y8
         y9U9l1biP5f8+BnfW1WZOp+BgwK/MoZpRbOgRSGsoTJ1P2Y8zhVxQqt5FNEcHd9+juEb
         QRqjY48fC8LZmZQNquzrtkYJ0Wxl7DFvBRpDGGzKDyOAVeb/YZzA8KlzhKBJR2/8rXH6
         ZwDNGWMKFU3+rREYHjnQf8WfaxsZyGzJApLTSvj+TbMFUNYvHB3cc4f3tyXsGZ+9bWev
         aqGLIz/qBm2OOqBXODMwjuiOGXVAiKj+5PTr09caTGgkPExDNMyligYbTDmrjFLDGQHp
         h2wA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946732; x=1783551532; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CCniczWZOyEeV0Ge6Nxh39xIY2urrQQ0Ui12ykaN+J8=;
        b=bxR1+bFiG4NfsFTZk2XtoyexX3H85eA2r7FRpxm/AjWnK0gE5xVwfi3HjNcWZ/ftkc
         252kWq/XuLl63YCZIyekSrlgq2W1hTHmo9dxrYbzt+4LTM7aGKoQSu8Uta9nDwi0sIul
         42J0FxDoCjKbPSzeQpdgj5mbQck0NpIHNKsfDB3zWypgiNac+pJJ3TSqG63/dtWMSCbg
         UPGscxyYhTzOMn6+oiK/IStmnV0e6yEFdKZj9bqRZk8qCtJrkus71SLN1if2jYZccz6n
         vdXxahy9N1ISgaKtu6V62S0eCiq0ZrQB4hsg/+1WLvFDCPyUxs3/4pQ2t18Z2rpOUCOv
         wi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946732; x=1783551532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCniczWZOyEeV0Ge6Nxh39xIY2urrQQ0Ui12ykaN+J8=;
        b=IC4toC234Au/EeOoqd/w25jCuxjHuxE/doMEi8LUkeXXawDfe6PDYpfwdr9yrhHZMK
         ddbbyFS1qK9xqg7rl6LDowqPxepi0czK22YHAzdUzrVuUFZe1MY83wEV30sxbLRbJyhc
         6l7P3+ZTxucBfJXlDU7xNB1X2JSY224DQHSAHvf5OlJSJl9iGHwSIHDxO5CvXcQJKRPQ
         2tNT5MiIgHn9mpYDAvJ8gStAp5fGm6yHEzMtsEmves6sdIHp99R8Uc/cv3FqsliLDr0P
         1ksUkLvWnuwzFFOjdnE0Hq2WteGSj7r4xKvb4rpTHSe/36XJSq/nP1o6A+bbUGSMbL9Q
         PAWA==
X-Forwarded-Encrypted: i=1; AFNElJ8w7gflRrR94NA9sj6DA8Ab+rITsncTTefB8PXnAoKvGQmMpBQlPn20CI2a4evn9PTLBX05PGbQ0vhD@lists.linux.dev
X-Gm-Message-State: AOJu0Yza0bWZ9V40yxBXnzFk3TzMIBgFApfltgNilezJwOWSBgGV4sOe
	CS4uYBMIO8YyWIYpPFgr+oQV556zcY7Wos+sKMjpDSxWdltHBnlw2moUdhOYbe+9lcYgltM58on
	otHoct4ZMzumeB2/gHMjSurne6BD3Hnc=
X-Gm-Gg: AfdE7cnH4xpeFS2K1jthzZatzMppERb3+88RMcxOFtM2rcHfsxkPmpdIGHfHziCmpT/
	vN3SznTcmUkHqCuU3aRLBNS0lYaBXsucQ2qgUxNqPuzDw2bnAoMBz5hxATUXw+NjDNC/8wCgx05
	hTK6OYkog9X+NMsBhaCjL8F1LTLkbfywDXgxvYr9iH7XwXDxvF5330BKX2jDF0RJ5cC8zW+ROM3
	qYr4LqzgpECCmc9PIDMJw0dTRW55ObU32hYTsX0/dO5j8d83HRq29J9CNFRjriRpgVn9aYCtnd4
	3qznYGgT38EFvdUqjPL+K7dwo+M15xc=
X-Received: by 2002:a17:906:d142:b0:bef:90af:6ff1 with SMTP id
 a640c23a62f3a-c12ae4f5b80mr132079566b.31.1782946732377; Wed, 01 Jul 2026
 15:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701110052.5309-1-luis@igalia.com> <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
 <87pl16c2z8.fsf@wotan.olymp>
In-Reply-To: <87pl16c2z8.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 2 Jul 2026 00:58:40 +0200
X-Gm-Features: AVVi8CdGn7NJhucJK8aiJQrh0fpDK3IqFuJTA8Y0SIG5j3wFIF0ieOj_O0ujD0c
Message-ID: <CAOQ4uxg-LcCp5_2OGFo71ejJEPc14uL_D6n04jwy3C2GuoWy7g@mail.gmail.com>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, 
	kernel-dev@igalia.com, Seth Forshee <sforshee@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 2:24=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> On Wed, Jul 01 2026, Amir Goldstein wrote:
>
> > On Wed, Jul 1, 2026 at 1:05=E2=80=AFPM Luis Henriques <luis@igalia.com>=
 wrote:
> >>
> >> When setting an ACL in an inode we can immediately add it to the cache=
.
> >> This is a small optimisation, as currently an ACL is only added to the
> >> cache when reading it again, which involves an extra GETXATTR hop into
> >> user-space.
> >>
> >> Signed-off-by: Luis Henriques <luis@igalia.com>
> >> ---
> >>  fs/fuse/acl.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> >> index 31fb50e16aed..c2584bb75ec7 100644
> >> --- a/fs/fuse/acl.c
> >> +++ b/fs/fuse/acl.c
> >> @@ -155,6 +155,8 @@ int fuse_set_acl(struct mnt_idmap *idmap, struct d=
entry *dentry,
> >>                  */
> >>                 forget_all_cached_acls(inode);
> >>                 fuse_invalidate_attr(inode);
> >> +               if (!ret)
> >> +                       set_cached_acl(inode, type, acl);
> >
> > This is undoing what forget_all_cached_acls() explicitly tries to do.
> > I think the reason is that kernel code cannot assume the server did
> > not modify ACL before storing them, not sure, but NFS does the same thi=
ng
> > with nfs_zap_acl_cache().
>
> In my understanding, forget_all_cached_acls() is cleaning any previously
> cached ACLs (even if the SETXATTR failed!).  So it made sense to me to
> cache the new ACL just like other filesystems seem to be doing.

Local filesystems do, remote filesystems not always.

>
> On the other hand, having a server modifying the ACL without notifying th=
e
> kernel didn't sound right to me, specially because it has explicitly set
> the FUSE_POSIX_ACL flag -- otherwise this code wouldn't be executed.  And
> that's why I assumed it would be acceptable to have this optimisation:
> because user-space asked the VFS to do permission checking *and* caching
> ACLs.

Your arguments make sense to me.
Only it appears so simple so it feels like I am missing something.
Why wasn't this implemented like that in the first place?

Thanks,
Amir.
