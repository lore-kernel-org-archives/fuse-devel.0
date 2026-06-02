Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC283E2746
	for <fuse-devel@lists.linux.dev>; Tue,  2 Jun 2026 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405286; cv=pass; b=CVyLDkdpk0ctitgILLpU02oEz9H9wZR932pxmd1PntF5jeISzP6a3woiU4Rsy6b1aBOSIr1xvFiGuvvH5bFNJOE70bQbMeZv8G/eit9Em91pw9OMJ8EO5OoSkVPvAC487aeo9hJPujFy3W5SYgPR213AoOmL8T0KNcZNgrbwi94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405286; c=relaxed/simple;
	bh=/ho6lGJ76kzPFSZknYfMFJy4z+tOkx5CZ9MjgdeQ1dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiM4aFwq9rBsDvpEQa1M7/t2WHmwixLI54by7TBUglXKBjazF8XbeduH/IcUuuIeMdxtt6ro4RD3AjFtbhYa5EuMmutb52zKMnPGK67NnoRcWQ7NfVnQGr4ZjPSMvplGGHiShIUF+vFK9mWjd7vT7yiElEg8pG+sTYxIJvjgSl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZKtbODW; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZKtbODW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so18494101a12.2
        for <fuse-devel@lists.linux.dev>; Tue, 02 Jun 2026 06:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780405283; cv=none;
        d=google.com; s=arc-20240605;
        b=UGgEbOzWxgRg7yu6wjJBTkeUweTRRA7cyv7AXfZisORLekU/5b8UUwzUgl9W+RzSMw
         DakrR7NTF483gNx6IzQD7eWCUnX9NoieO3P3t9SL8tA5/3SAhCjU3B1sAeBx5fGfm7sJ
         u+YwhOnPkn7H1xoh6taY4mHdmLP697fJIzrE4mHSbBd6PB7h+fH+BaHM+BGg+VdxcTbX
         CDmkLmYsb81ZJGVtftQRBdQTAWNxfLcWRBXZhO/i1MZtKF4fBZD5QgmkgpVnzRMGX7fq
         +UQ/pUaFNQ4j3OrU26yOk9riniZlqUhUyp+zikh7QqjQL658H/PzdEaZuSyiO5ABBRJi
         HRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GT12yK06xRWdhw1OHOoMBEbkBjZ5NuBepZ00tWwU0+Y=;
        fh=uSD2NNJ/dlKWfactusHtJ82cK22wZzRJSn1fc18Gx9c=;
        b=HyD/Ua9iJaK0ZZOG1GwPybV/TjpLoxwi9971aiI0thcJYX6RGd4uLctlMXMk+e3Ynh
         ihdgdH+ghL+3RT+02rVNQHYpUUCj5WQ8FTTyjgCAYFultn3Sh7Kjwa8uZVjcQnDbqRVI
         wVobV2DDEaCyZMMHsYxNHWdv5ITHZ19pibKTXvpKyG2MBYOP8TdFG/p+k2L94H/77jFw
         Y1H/BfSIeLyLZXRf1qNNjRxIGpTKRVY/uLu0JokuF8qKZ9Vy2PNzy4YETtVpnadEumCL
         YhEzTnxV+3GpPJdSsukiOm9e1p16EOD6wEQQFP788PkVvRwzuSwq8iSxX1+XGEgh7EVQ
         mwpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405283; x=1781010083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT12yK06xRWdhw1OHOoMBEbkBjZ5NuBepZ00tWwU0+Y=;
        b=RZKtbODWfg8lWZyyO957Dk9trMetJmXSvT0OhKML0T/1J9Aobwjk8JiRj8cyka96/o
         jI+H77NV/5+GWYW/7APPmgEH7jXA9zcSobhR1lc+ZXNYJlhUUOsqyKX0zKiPk1b8+cFJ
         BikpCRf++CvF5L9+5zlR0dDjzQK/35tHvVR/ebJidVNJA1OZTK+javduqxj5VPW8029o
         pqpHI5DpXsUK6JF0x+AO2E2O1K2LRrzT50qQUXdz6qXiVghmU6uu4YJiaDTMjdNhxNnY
         duniL6B1hp94HrQqO9jqwQPUkDDMzjPM016MU7yVps3Hv4QKbLvGx2vsgXYVG7KavynV
         0jAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405283; x=1781010083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GT12yK06xRWdhw1OHOoMBEbkBjZ5NuBepZ00tWwU0+Y=;
        b=PUtDUxSaXsMirnmKW60fWTKaYBWNgblEjR0tJFyQDQyTMXBLrEJP0IiSESQd+s8+PL
         Y6SMG6US/+GVnUPSaeBuTjDe+lQhEgiFednOCoJZM7m8xXTBznL9XGblKWkG7lAe9XPs
         4/7koP1eEUmkcVXHfj4Q3UknjFpgcmjXWULjTHTQP4TkA/3T+0dflWR7l6O3xNnLe5oF
         Fu3mdEboaFcSrPhK3Hi6Uceorni3sqtQZzssbQmebspGmUK379PzaQgqKN1cI6zrWT80
         feJVh4hdvDGMRVo9ApNCgGN51yHtJSiTBHM3XbiclDJV7BYDsLSj0NMucBNtGfVIdT7q
         bhAw==
X-Forwarded-Encrypted: i=1; AFNElJ8pdncpjclqnihGLxGH7u4cmr/GSdjGMb8sJhuSfwSK2bdv/+EmWimNq1TZG7EUWtsZTNANrFTGSX0+@lists.linux.dev
X-Gm-Message-State: AOJu0YwWYld1UYd00Yh84KEknEVS1sPETuSnzbd5mVfSFxbvBOAD33RM
	QgbwXxVxUDJjxmANQ513/EvN/UBmyPUZ0tuNbe62YINOtci2/Sa7eG7R/jfMq5xbYblxo/HWeCO
	+nXJIhIAytXYwOD2HhtYq1qv4Z4MasRpHT/ucZSY=
X-Gm-Gg: Acq92OGzytdtkweVtoretEbOs49NOM94iXDUzX6OeLfJ0YegFhES620nqIfaAYWgE6n
	DUNYF41WiWzQJxWuV11nbbQchyueccNO5kImtaBqlbgBvSrSuE0LzMkSyr0uXrxMCKB7z7uxdtX
	3ZsR1zYCP9WLNaj+HtFFfj4YBUsfosME4HQ0l51chHkJOm6VnT1VWy1k4rCEv7GEKiZt2627duf
	cUmxP0B1f1TtxjJEW9mvaHk9xKgyG3VBHfj3pj+gQ9xxFmZrsMauAru9HkWM6mTnn0RlnvwaFKu
	Gx4AJAZXai5h7U9c2ptmkId8i/AcxoNbUkzl+70JTZ9VtQkCPbiv
X-Received: by 2002:a05:6402:285:b0:677:75e5:a1b3 with SMTP id
 4fb4d7f45d1cf-68c8cc290b4mr6202827a12.18.1780405281580; Tue, 02 Jun 2026
 06:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529134302.1989958-1-mszeredi@redhat.com> <ah5-40YypaswEG-1@groves.net>
In-Reply-To: <ah5-40YypaswEG-1@groves.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 2 Jun 2026 15:01:09 +0200
X-Gm-Features: AVHnY4LI10OeqWefZhuYWnhAbyP5T-wCIDkQosynud5f2Rd959bkvyQoiKpPdRs
Message-ID: <CAOQ4uxj3ROiCCRxPnbNJkTzU4KvSYCiVj7jAe6koKZgw7t=2Kg@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_GET_DAXDEV -> FUSE_DEV_IOC_BACKING_OPEN
To: John Groves <john@groves.net>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 8:59=E2=80=AFAM John Groves <john@groves.net> wrote:
>
> On 26/05/29 03:43PM, Miklos Szeredi wrote:
> > The difference is that now the server needs to look at the fmap and che=
ck
> > if any new device needs registering, the device index is now allocated =
by
> > the kernel and returned by the ioctl().
> >
> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > ---
> > This is the first part of what we were talking about: using the backing
> > file API for dax devices.
> >
> > It's on top of the famfs-v10 patchset.
> >
> > Totally untested, haven't even tried booting it.  Obviously needs
> > nontrivial conversion in the server code as well.
> >
> > Thanks,
> > Miklos
>
> Miklos, thanks for looking at this.
>
> First, a scope check. This patch touches only the daxdev registration -
> GET_FMAP, struct fuse_famfs_fmap_header, and the simple/interleave
> extent structs in include/uapi/linux/fuse.h are untouched. I'm reading
> that as tacit agreement to GET_FMAP and its ABI. Can you confirm? If so
> the large piece is settled and this is really just about how a daxdev
> gets registered.
>
> Device indices - the part that has to be right
> ----------------------------------------------
>
> Everything below turns on what a famfs device index *is*, so let me make
> it explicit, because the patch's model of it (kernel-allocated) isn't
> workable for famfs.
>
> Famfs daxdevs are shared memory. The same physical memory is mapped by
> famfs on multiple nodes, and on each node it most likely has a different
> name and dev_t. What is invariant across nodes is the daxdev's UUID. So
> a daxdev's definitive identity is its UUID, not a path or a dev_t.
>
> The index is assigned by famfs userspace, as the order of appearance of
> daxdevs in the famfs metadata log:
>   - the primary daxdev (which holds the superblock) is always index 0;
>   - additional daxdevs are introduced by ADD_DAXDEV log entries and take
>     1..n in order of appearance.
>   - ADD_DAXDEV log entries establish the UUID-to-index mapping
>   - any file may have extents referencing any or all daxdevs defined
>     previously in the log - by index
>
> Two properties make the index a userspace-owned, cluster-invariant value
> the kernel cannot allocate:
>
>   1. Bootstrap. The famfs metadata log establishes the indices - each
>      ADD_DAXDEV entry defines the next - and an index can then appear in
>      any later file fmap. But the log is itself a file on index 0 (with
>      the superblock), so index 0 must resolve before the kernel can even
>      read the log. The numbering is fixed in the log before the kernel
>      sees any of it, so the kernel can't be the allocator.
>      (idr_alloc_cyclic never hands out 0 anyway, so a kernel-assigned
>      primary couldn't even be index 0.)
>
>   2. Cluster-invariance. fmaps live in the shared-memory log, read
>      identically by every node. A given dev_index must denote the same
>      daxdev (the same UUID) on every node, even though it most likely has
>      a different name and dev_t on each node. A kernel-allocated id is
>      node-local and mount-local - the wrong kind of value to live in a
>      shared fmap.
>
> So the index must be supplied by userspace (which owns the log and
> resolves each index's UUID to a local device), and the kernel looks
> devices up by that index. Resolving UUID -> local device is inherently
> userspace's job; the kernel trusts that resolution and never needs the
> UUID.
>
> This is also why the hand-rolled daxdev table is the right structure, not
> incidental cruft: a small self-contained array in famfs.c, keyed directly
> by the dense zero-based index, closing the discovery race (valid flag +
> wmb) and giving O(1) lookup. That's exactly what this index namespace
> calls for.
>
> Identity by reference, not by path - this part is right
> -------------------------------------------------------
>
> The genuinely better idea here is getting the kernel out of resolving a
> device pathname: the daemon hands over an already-resolved reference
> (you do it with an fd, from which the kernel takes inode->i_rdev)
> instead of a string the kernel has to kern_path(). I want to adopt that
> - credit where it's due.
>
> The minimal way to realize it is to have GET_DAXDEV return a dev_t: the
> kernel uses dax_dev_find() and kern_path()/may_open_dev() drop out
> entirely. No ABI change - struct fuse_daxdev_out already carries the
> index and has reserved space (sized with room for a uuid), so it's just
> filling a reserved field, and the index is already first-class in the
> reply.
>
> The fd delivers that same dev_t (the kernel already reads it from
> f_path), so BACKING_OPEN can realize the same idea - but the dev_t is
> the part that's actually the improvement, and the daxdev reply ABI
> already models (index, dev_t) while fuse_backing_map models neither. So
> realizing it is cleaner without the fd than with it; the costs of going
> through BACKING_OPEN are below.
>
> On BACKING_OPEN
> ---------------
>
> If you feel strongly about FUSE_DEV_IOC_BACKING_OPEN, I'll make it work
> - but I want to be honest that for famfs it's a shared-almost-nothing
> approach:
>
>   - famfs needs its own handler regardless (the famfs branch of
>     fuse_backing_open), and that handler can keep populating the famfs
>     devlist exactly as today - so the only things actually shared are the
>     ioctl entry and the {fd, flags} struct.
>
>   - it forces 'select FUSE_PASSTHROUGH', pulling in file retention, I/O
>     forwarding, refcounting and close - none of which famfs uses. Famfs
>     maps device memory directly via iomap/dax_direct_access; there is no
>     backing file and no famfs close path (fuse_backing_close already
>     returns -EINVAL when famfs_iomap is set).
>
>   - the ABI doesn't fit. struct fuse_backing_map is {int32_t fd; uint32_t
>     flags; uint64_t padding} - it's fd-shaped, with no dev_t field and no
>     index field. To use it for famfs I'd have to carry the device by fd
>     (which forces the daemon to open() the device just to register it -
>     the daemon otherwise never opens it) and smuggle the native index
>     through padding. And the fd does no real work: in famfs_daxdev_open()
>     it's borrowed only to read f_path -> devno, then dropped; exclusivity
>     comes from fs_dax_get()'s holder, not the fd.
>
> On access control, in case it's a concern behind the fd: the famfs path
> is already gated on the server holding CAP_SYS_RAWIO at init -
> FUSE_DAX_FMAP is only offered under capable(CAP_SYS_RAWIO) in
> fuse_send_init(), and famfs_iomap (hence GET_FMAP/GET_DAXDEV) is enabled
> only if that flag comes back. So the registering daemon is already
> raw-IO-trusted; there's no access-control gap an fd's open would close
> (may_open_dev() isn't a capability check anyway, just a mount-nodev test)=
.
>
> Net
> ---
>
> I'm glad to (a) confirm we're aligned on GET_FMAP and its ABI, and (b)
> switch GET_DAXDEV to return a dev_t instead of a path. I can't move index
> allocation into the kernel - the index is a userspace-owned,
> cluster-invariant value for the reasons above - and I'd keep the famfs
> daxdev table where it is. Lazy discovery has to keep working either way:
> only the primary daxdev is known at mount; the rest are discovered as the
> famfs metadata log is replayed and first referenced by an fmap.
>
> If you still want BACKING_OPEN after the above, say so and I'll make it
> work, ABI overloads and all - but I think GET_DAXDEV + dev_t is the
> smaller and better-fitting change.

John,

Allow me to be blunt, because I find your email counter productive.

I insist on BACKING_OPEN. Please stop going in circles.

Miklos is working hard, doing all the work for you, basically preparing fam=
fs
for merge nowish and what I hear when reading in this email is a very long =
rant.

Maybe I am slow, but from this very long email, the only thing that I find
technically relevant is "the index is a userspace-owned".

All the arguments like "famfs does not need to open the device" and alike
are, unless I am missing something, completely irrelevant and counter
produtive to your goal of merging famfs.

Yes, you will need to make changes to userspace, please don't list those
as technical arguments for how the kernel should be implemented.

Letting userspace assign the backing id is trivial.
Can either create a new ioctl DAXDEV_OPEN or reuse existing fields
and flags in fuse_backing_map, so that passthrough server could also
assign its own ids if it wants to.

It's all about sharing the infrastructure, not the ioctl number.

Are there any other technical problems that you can point out
with the patches that Miklos posted (including FUSE_DEV_IOC_STRIPE_OPEN)?

Sorry for the tone of my email.
I hope that the good intention of working together towards an acceptable
way to merge famfs speaks louder than my ranting.

Thanks,
Amir.
