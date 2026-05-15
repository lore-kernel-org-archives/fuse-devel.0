Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0B3ED133
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 23:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778887016; cv=pass; b=PV9WMpo/G/N6LleQyuvSUvnBPiDcBX9XuOFlGclgPBSlVan7qOtjG+picqdyKlZ6ehOgDIDx29vo8FdiTbOZYrwJdCYr3NpQy/nf5wlmRPxBlxHKMbzGVZEKW9rev0BQ1+w/J4AUzVMe8Si0X8kCufvB52gqCKYm2OxA+9Iz+7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778887016; c=relaxed/simple;
	bh=7K7tZs1hc2oPZ1IliccEThEHd45h4scRJ4SOua+rVr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGsiDQj23eh5H4j/UEtqwKqvOo2U6p6L5jqz1jf8CQuemOytcb9W9GqeL/SQAt+pPpkE4GpQq9HJNGoC8o1HTZqqMjgDJMFf59nAwSAmYkbC1o+D3sOrD8UWR2jIQfzLzDgmzCmKQB78+M8NlyMlEetN8cujyakVCOlUumw0RlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSe8yrk3; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSe8yrk3"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso1152751a12.3
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 16:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778887014; cv=none;
        d=google.com; s=arc-20240605;
        b=d7piS+Cr618ktUVMn2XyGPIIOhf386bTqW1B8yWogQCTzgTAIQB47AaSvWBNzCvJ06
         aiYVRpetHq8vclzLCoXIryu2Tcul8vwIc/oWnS9d6em5RnYrO/yuTTsxooyGEGyA2/Bl
         zPs7G0HLmEkOTP0YaSyl0IyYUbDGmexqXo+BaqMUIhwq4F99bLVlzIGEVclhv0/3Cc3l
         K0166hOjZery6z8WO7yNzsjUF56vkT4wbIM7gP/bKv/xiVIkeGp5W/LwFKn92fvyegVV
         0/jI9cilWScONgIWyW9ZUHOKXgFIgfd3lmL6luSS+UF/nqbAAja2Dp/A04IBIgQ0K1iQ
         KvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyWunBeeWyIIt7WsSCYZEVF16khRNOvYgYQosGWQv54=;
        fh=f9auwgwPn9+awcAA7DLCzl3IFQK8y82iA+pFOiBY5Fk=;
        b=PcKkiNKyUDByxSg44apT+Yb+xpShYyS6JScJwEbClswy2T020E2ThK7LMOZsx0zW9r
         IHciQ1SRO/5Rkop3ZXlGENKpvIoOmwl53s6CchRuRjLOm6sYmlzynepubhia3Nt8VG4E
         hy7ieDuQ0m3fLpZwjBHWjVFs/h1Y4PCMnGIucU0nRCBeCgek1ifj1dxKnOR3HpLcWOAl
         2imveeUzijcGQe81iFN+LoAL3oDJKH34kDh5QkWj2+WNebIPDf/NxeKw7c+rtrK29qah
         8o3WDxuG74V+Qgu6hpZOOe9CKX2V3E+KSrtuzuJYy8U1aMGpDhUesx8R2CrxBD2SPv+c
         pZ1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778887014; x=1779491814; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyWunBeeWyIIt7WsSCYZEVF16khRNOvYgYQosGWQv54=;
        b=oSe8yrk3z8zTgV2JtJsyfZlSK7c8X2V+XA1VaH60lnS7nekS32Rppypu9GBTVeZn7S
         gMDLF84eJYvWN+HZY08J4U+gq77w0JxoMsqoiZAAdgV8t9EGOutEO6uNSSph4zyxI2KW
         AlyaV9zzOi3qrk7udOW9ApxqmW4Q7BOYY5M/s6IsC6ju7kN2mcLJiKxoburz/azrN43f
         Pg6bxE1/4t+stvNb9oz9iaf0zZy0xtKM7Ty4p11vlvSSVWJNaTRyUvggpqLWiJPKC/sZ
         gHXwOQD94n1vmVay46wgIQytNF9x+L73Wuoe8prMT6bb3MLG7yoyCZdjhigiDNrsCpni
         iwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778887014; x=1779491814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZyWunBeeWyIIt7WsSCYZEVF16khRNOvYgYQosGWQv54=;
        b=sn9ktjEx789zCIvZjDQye2OgpE8glwjL/TGmtkImc/v+232bThfFxgdqL6lwzwjknZ
         s6QOhVqS/CMWpsDHu/ZQOVUrhcyESQfV7GuLep57UwKvUdmaYE5DP9O2EEJTilaaI1qj
         tkaa6KJmU3YAXdFrDtYYlFFH4jYC9SwIDm8u26RvvicCJmDzIko7u0gamPTDAkH83lvv
         udFYQXXwUxfQ4mSpfnrLLZPydoYGn6fvF3y2b2BxqpV1VZZTyFcsOjv0JtOuG4ZdCoee
         IzEtUAxeQ4k8A8NDmLBa8GueVYk1d3B4JxtR8d1uCWsajFg4vce9MFvm3Zx/ck+vo3NW
         HaUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rda8YkFIams9MmI1xunHqQUAvaTtiH56Ij/3t8JbE1pXdXbIIB8U828W8v7dExp3EYoAXeI6dFbqw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5i2yTf5QCOk55UrwfAkwF5p3KvHCpHjV58I6UToLoSIexm23p
	6b55HROpPVgmJYB/7YOWBwdMP44b7fBxpSPv2fabm7gt9eQ/RtOmnAzKPfjjQNZPJ5p/lDkLyO0
	u376WgirkfY82p+tEMpn8tvJ0yUulVoI=
X-Gm-Gg: Acq92OEvPj2SwSXctGGAvZVCaYEDCOdEc5tAlwUh83ihWH/Prj1lKVsw1A05ALq+prA
	0r1QuzrbGQbfcCp3fWP5YCrdsTLQi86C4iwMSHJiKExYI15VZEz4y71YrZlZ8ZSaPcQtnauVM+0
	uAd00VypGxnmpz7toFekJ3pW+HNnYAq77lTfzfubijXMfr/dsAyd4goViCAYsMgbsTcN+gPVBB6
	/7sq9JysJiwwIwxtJfbY1lDQoTqsA66XgPjy0bsMPLJE5uz5BVp3Qu7QL8KAE0Iteb7m5oHcGf2
	h1DataDT78HNrzk9Fjtz/X0d1A5ytmcYHbv7B3GuopsirJ1tFi1s
X-Received: by 2002:a05:6402:26d0:b0:67c:1ed6:2793 with SMTP id
 4fb4d7f45d1cf-683bd19552dmr3139618a12.22.1778887013598; Fri, 15 May 2026
 16:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177747206436.4103309.9048553717124547447.stgit@frogsfrogsfrogs>
 <177747206510.4103309.7610933581068572895.stgit@frogsfrogsfrogs>
 <20260514220921.GI9544@frogsfrogsfrogs> <CAOQ4uxja1znK3pz3YAX2uFM-GFVS1zENHJzHBLAVrVqcz6bVhw@mail.gmail.com>
 <20260515213600.GE9568@frogsfrogsfrogs>
In-Reply-To: <20260515213600.GE9568@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 01:16:42 +0200
X-Gm-Features: AVHnY4KSrjVIm6SZja-smaSbPRCng8_nCZOGO6mkeeft-946xvHHrpupCHsPgyo
Message-ID: <CAOQ4uxj=ynNdzncciLP=caZD9UgUWn5Ebch9NOOzO3btrgwBuQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] fuse: enable caching of timestamps
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, joannelkoong@gmail.com, neal@gompa.dev, 
	linux-fsdevel@vger.kernel.org, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 11:36=E2=80=AFPM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
...
> > It is so easy to get lost in the code handling attr cache coherency
> > between kernel and server, so many little details (a.k.a maintenance
> > nightmare). It's not great now, and becoming worse with iomap.
> >
> > On top of existing writeback_cache special casing and now iomap
> > more special casing, passthrough code also has special cases
> > that may need to be handled better.
> >
> > Can we maybe abstract some of these open coded checks in
> > a way which is easier to review?
>
> One way would be to decide that if the fuse server sets FUSE_CAP_IOMAP,
> it doesn't get to use any of the other functionality -- no dax,
> passthrough, writeback_cache, submounts, or anything like that.
> Whatever the fuse server thinks is its dataset for inodes and the
> directory tree, those are the *only* files you get to have.
>
> The downside here is that fuse servers lose a lot of flexibility, since
> (afaict) you can have a fuse filesystem with (say) a combination of
> passthrough and writeback_cache files, and that's why (IMO) the codebase
> is /really/ hard to understand.

You're preaching to the choir.
I tried to argue for this but you and Miklos outnumbered me
in the pro-flexibility camp ;)

I am not against flexibility
I am against flexibility "because we can"
Come a use case that justifies the extra maintenance (and testing)
cost that we pay for this flexibility, it will be time to consider it.

For example, passthrough and non-passthrough in the same fs
of course - we have a use case.
iomap and passthrough on the same fs - maybe.
iomap and some remote file that may change remotely - less likely.

>
> Then we can simplify quite a lot of the special casing crap all over
> fuse because I can create my own iomap-based file_operations.  For
> example, ->open becomes:
>
> static int fuse_iomap_open(struct inode *inode, struct file *file)
> {
>         struct fuse_mount *fm =3D get_fuse_mount(inode);
>         bool is_truncate =3D (file->f_flags & O_TRUNC);
>         int err;
>
>         if (fuse_is_bad(inode))
>                 return -EIO;
>
>         file->f_mode |=3D FMODE_NOWAIT | FMODE_CAN_ODIRECT;
>         if (fuse_inode_has_atomic(inode))
>                 file->f_mode |=3D FMODE_CAN_ATOMIC_WRITE;
>
>         err =3D generic_file_open(inode, file);
>         if (err)
>                 return err;
>
>         inode_lock(inode);
>         filemap_invalidate_lock(inode->i_mapping);
>         err =3D fuse_dax_break_layouts(inode, 0, -1);
>         if (err)
>                 goto out_inode_unlock;
>
>         err =3D fuse_do_open(fm, get_node_id(inode), file, false);
>         if (err)
>                 goto out_mmaplock;
>
>         fuse_iomap_finish_open(ff, inode);
>
>         if (is_truncate)
>                 fuse_truncate_update_attr(inode, file);
>                 truncate_pagecache(inode, 0);
>                 fuse_iomap_open_truncate(inode);
>         }
>
> out_mmaplock:
>         filemap_invalidate_unlock(inode->i_mapping);
> out_inode_unlock:
>         inode_unlock(inode);
>         return err;
> }
>
> Obviously there are a lot of fuse features that I'd just turn on
> automatically if the fuse server sends FUSE_CAP_IOMAP (like atomic
> truncate on open mode and killpriv) to eliminate even more special
> casing.

<nod>

>
> Another source of simplification would be to make iomap/exclusive mode
> more aggressive.  In that mode, the kernel uses all its file attribute
> update logic and pushes changes down to the fuse server.  All the attr
> caching and timeout stuff goes away, becauase local filesystems are not
> cluster/network filesystems and don't have to worry about pushing
> changes up to the kernel.

Yeh, I suggested this in response to another patch as well ;)

>
> OTOH at this point I've forked fuse.  But if I'm going to do that, I
> might as well just burn the whole thing down and start over.  I don't
> yet have a good vision for how to handle the slow stuff like the
> directory tree.
>
> > Thinking about some attr_mask in the inode which determines for
> > every attribute, who owns the authoritative copy, server or kernel.
> > For example, for (writeback_cache || iomap)  kernel owns ATTR_MTIME.
>
> For iomap/exclusive mode, the kernel should own all attributes.  I'm not
> sure the current codebase actually *does* that though.
>
> > This is very hand wavy and far from dealing with all the complexity
> > in every specific case, but the bottom line is - very hard to review th=
at
> > this is all correct and nothing missing and very hard to figure out
> > what's going on when looking at the code
> > for humans I mean... Codex seems to be doing well ;)
>
> Not really, it's been hallucinating from the start.  That's why half the
> comments are credited to codex, and the other half are the WTFs I found
> while scouring the codebase whilst trying to understand what nonsense it
> was telling me.
>

Ha ha.

At least it is doing review :)

Thanks,
Amir.
