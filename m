Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD436B90A
	for <fuse-devel@lists.linux.dev>; Sat, 12 Sep 2026 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789233298; cv=pass; b=ceEpKmua9aUIhRP31gxFA5KUUNfS4gSL2l/VxyU3t1fpXj0kztp9RyBg8c7WjgM4SJ9XkLl8wOb5hLozDHDNM56i/yN6hLrrK1nplt052vwY1cmIm6PhTmYY61A9wjd/r+oiB5dJjaxJ8AsIOwwtudC3IBFYCE1ZbpIRuJ1YiLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789233298; c=relaxed/simple;
	bh=+FW0pbG0OmhW4/8ZrhnzMMIRgqPmeD7bCWQclF0zYf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAeJ8/7OF6Fc/VwCAimw0MW425FnF/IoHrNN2GkXY0EL2J+if8JkxpFOza6Z/sTYye6gzYHJ9K6LFeoGfaEreEDHV63FHh3h6cY2wF1HD0MSwkAT6E2WOOkFwEIXaQdmEhHrJtCMR+Wi/5edroIbCYLdOasOylRE+qlf4wckdEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDQuOZPo; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDQuOZPo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2940d16190so279929166b.3
        for <fuse-devel@lists.linux.dev>; Sat, 12 Sep 2026 10:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789233294; cv=none;
        d=google.com; s=arc-20260327;
        b=kTkT3NMuduRxuW5835UtYMFXGb8iruDg3JGT1wA0L0iazbYFHiBQtCK3rnV2bJogFu
         00QRe88DhE/PYd46c2xO0aKnut7i+UEsfWoIb+itvI6gI7tHIZLZ0NSINa6kLku2ojk4
         fpVL3hx1zmlo6GRwHv6h2q2KqR5N7Ew6G8vuEjUCdLvuF724+ToqM9XoOewxaHFu3R3O
         es/0SEhw3gO3NQMuU0yV+JGar1TsBoeuLYmYxtfgUTVwFIoXyttCQo99utzWKFfGGSbg
         SDEuC9H3loCOMgzQDv6tOCNaovlVGhARyvzDLTLzy394eKKtvBB25uJMQUSDHvBiLNtC
         pMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KRAPNhTa/+jL5NE3IQve8IfPyvKe3Wz0oKp1H5EXtN4=;
        fh=VLSwf/34+SpAdJ+CzHUYxociFcHStOkIavk/3/RyP1k=;
        b=iuzikbkVaNF8YFoX95rlQXHoxxz+LGPf4ScuLyn/n1Y/rdXlogrgCGgiNhHdvZfK78
         dpHlZL6FMpx+If5tR9ExY3mbFHWD+9DNoyPUrs1KYj0AUpTDrjfjmPtS1o3kCl4lQRL2
         sKGw3CZ3eKub5Fsbkj68G8ze+NeRYd6co3ZrD1XTVcQHclzmTRA4qMFXdCf5sq72up8E
         EBrHqJDD+OxQLZSlzTajUD2v7UV5vnL33BPpaN4VTjA0iVugRqc+HtUQ+aI0jYaOqV22
         yE/ldAQCXOtnn2/3RGykLTjBVqmS3PJCJrh8XxVtiIvoNE10vXgJmchcvObWSIyB+z2/
         EU9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789233294; x=1789838094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KRAPNhTa/+jL5NE3IQve8IfPyvKe3Wz0oKp1H5EXtN4=;
        b=BDQuOZPokyG2+Iz6BSBV8nOmlykPHpxwwJg31j2OlJ+RqRVYhO8+3sgHPals2qp2iq
         roOWm1MHH6PgwHAbnrmiFAZFfBpxoXJpgWWnMq5LWY01hAyPyaLD9DFKBDnpmbtq+N0T
         jZpU2xM49cwjo3+coslGIdX3rJal86dN5Pu3apmkN3GcICBqJf8D+FdrzqifV3c6GLDx
         CujdijEfNvucUC55ui+v7QsO8UFn4dg0QAZVB3yBqxAmfHFANxAHjNqq0raQQ/ktFBKv
         Z4d42gg4nDVStQOP3/6ojOBQrrNbaFvKWj245gG8RG7poFrkMWsi/w1+7SH/jq0sBEO8
         a3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789233294; x=1789838094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRAPNhTa/+jL5NE3IQve8IfPyvKe3Wz0oKp1H5EXtN4=;
        b=skbzmRGLMOB6gaUqC5/ZjpQTnWrD8qp3yrAQoGopsyebEGx+3jxuySObeUBtBe2eWY
         YuecfdgY6oSx/j1A9AXrV6PDGc9kA6sYGKZlZjszg9l0SQXt2DcaqAOpXFXFYJVuaqNp
         nv8qrqn0XtgK1I6QL44OqvCOZCcLMelb9B0OwcTVxwhMrEI5w8zIHlokB23mf4sltY3H
         pgfwuYp6NZ0lBq+SVV3wap1iDzcatBv76DNOeJVqfklSEat6zLlpcXLlu8R2CVa/3FXb
         xQH93xWVHh2z+yCABsxQv4DpwaLCMB4jhScOlQpWNI8tkqx04H6YbDA88ZdmqfE3brmP
         sGjw==
X-Forwarded-Encrypted: i=1; AKwUvBwzVk+X+l45JrGEs1EKIFbufgdg+qGiqFYa/TInhW7FeoHPBd2vslRRMlWsfFAnKBJWEQJvkRh4E0kx@lists.linux.dev
X-Gm-Message-State: AFuF++mTZMwHO5ACxhdk9OkpLAlGy9+vbjwOKYSJwG6oaeK5dMw2peO4
	WpMH9+qLgpZoo6PTTMY2bOFaUKc9H9v9H3nCFPty7uPS24ImCfGOoVSnU4g8DsjDH+NUCKFUZvV
	XCCUtzWZZ8y9gyvIdNWAipbat+E65usQ=
X-Gm-Gg: AYBFou3b79w3ESdmysbaGoFj7sIjlMJPVQgw78hXtlQCfBpJnDMI27eOJppaikOWOkE
	7evD093JElPNYI3SPgb5d123y8WFoajC80PDCCzHRUTg3HXwWtZGmOiaPF9/qRxd84jJLEu19fD
	qOSm6t9pP/dsLFU5SEBJsqxXzTtIOZFyvzlxVPBxUJcyox6BSZTOVXEtaVdfcPGPizJF0uFxx8Y
	XFRam5pz/WbO391lDOwvGbOXiHIihpqumLjadFJUOZ/JHt+9PdXimMNkDh+JTvugBYTWe9egVlY
	hYFIbvPiHZ/QMIrZ5ONJqkdbHCzEHfYJo/yhkydUuYM/N0Mp4atCqJPYb7f3Li6Sx9o=
X-Received: by 2002:a17:907:8b91:b0:c26:19e3:e979 with SMTP id
 a640c23a62f3a-c29667467b6mr478184466b.25.1789233293638; Sat, 12 Sep 2026
 10:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <CAOQ4uxhbbfn7pnq3YNMKpYDAjyZXdZcJoBpnkzjJwOdeDw9jow@mail.gmail.com> <CAJnrk1aBBVOY_bi0s8-FZm9EST2NNePW7jkX3J7ygQ3vaer7Tw@mail.gmail.com>
In-Reply-To: <CAJnrk1aBBVOY_bi0s8-FZm9EST2NNePW7jkX3J7ygQ3vaer7Tw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 12 Sep 2026 19:14:42 +0200
X-Gm-Features: AcwNN1VyqcGoVQnwjkC7DVLNcJQhG2IGzH2-wJ2MfUq75vtopdqS3aPOVXQtpB4
Message-ID: <CAOQ4uxi_bdgJV4P0sgWbvhoTEHjSOhSHS=NcSymHp5-bdC_tzQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] fuse: extend passthrough to inode operations
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 12:37=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Fri, Sep 11, 2026 at 5:56=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Sat, May 16, 2026 at 2:51=E2=80=AFAM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > This series extends fuse passthrough to support inode operations (get=
attr +
> > > setattr) and directory readdir.
> > >
> > > The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse =
inode
> > > only when a passthrough file is open. This series introduces
> > > FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode numb=
er
> > > mapping, which allows attaching a backing file for the lifetime of th=
e fuse
> > > inode.
> > >
> >
> > Hi Joanne!
> >
> > I wanted to see how we can unblock this patch set
> > (did someone say conference driver development?)
> >
> > The main contention point for me on v2 was the fuse_entry2_out API.
> > And the suggestion to do a composite LOOKUP+STATX defers this patch
> > set to the unknown future of fusex.
> >
> > My favorite solution to a problem is to avert it.
> >
> > The question is how to include the backing_id with lookup/readdirplus
> > reply. The answer is that there is no need to include it.
> >
> > I have already discussed with Miklos changing the UAPI to
> > widen the backing_id to 64bit and to let the server choose the id [1].
> >
> > Considering the fact that FUSE_PASSTHROUGH_INO literally means
> > one-to-one inode number mapping, it seems a bit idiotic that the backin=
g
> > id (should it be widened to 64bit) be anything other than nodeid.
> >
> > The new 64bit UAPI is something like:
> >
> >  struct fuse_backing_map_v1 {
> >         int32_t         fd;
> >         uint32_t        flags;
> >         uint64_t        padding;
> >  };
> >
> >  #define FUSE_BACKING_FLAG_INO_ATTACH
> >
> >  struct fuse_backing_map {
> >         int32_t         fd;
> >         uint32_t        flags;
> >         uint64_t        nodeid;
> >         uint64_t        ops_mask;
> >  };
> >
> >  #define FUSE_DEV_IOC_BACKING_OPEN      _IOW(FUSE_DEV_IOC_MAGIC, 1, \
> >                                              struct fuse_backing_map_v1=
)
> >  #define FUSE_DEV_IOC_BACKING_CLOSE     _IOW(FUSE_DEV_IOC_MAGIC, 2, uin=
t32_t)
> >  #define FUSE_DEV_IOC_BACKING_ADD         _IOW(FUSE_DEV_IOC_MAGIC, 3, \
> >                                              struct fuse_backing_map)
> >  #define FUSE_DEV_IOC_BACKING_DEL         _IOW(FUSE_DEV_IOC_MAGIC, 4, u=
int64_t)
> >
> > ---
> >
> > - Server calls BACKING_ADD before open or before lookup
> > - fuse_backing is stored in backing_map hash table instead of idr
> > - With flag FUSE_BACKING_FLAG_INO_ATTACH:
> > -- If fuse_inode of same the nodeid exists, fuse_inode_backing is attac=
hed
> > -- On instantiate of new fure inode, if fuse_backing exists with this n=
odeid,
> >    it is auto attached the the fuse inode
> > -- This attachment lives until inode is evicted (same as in this patch =
set)
> > -- requires FUSE_PASSTHROUGH_INO
> > - Without flag FUSE_BACKING_FLAG_INO_ATTACH, backing is attached
> >   to inode on open as today and detached on last close
> > - The server attached backing survives inode evict and it is up to the =
server
> >   to do BACKING_DEL on forget if it wants to
> > - BACKING_DEL only removed from the backing_file hash table -
> >   it does not detach fuse_backing from the inode (as today)
> > - BACKING_ADD to already mapped backing or already attached inode fails
> >
> > FUSE_OPEN reply does not need to include an explicit backing_id.
> > It's enough to set FOPEN_PASSTHROUGH because the backing file
> > is already attached to the inode.
> >
> > Similarly FUSE_LOOKUP and readdirplus do not need to change at all -
> > server just does ioctl BACKING_ADD before the reply.
> >
> > For backward compat, FUSE_PASSTHROUGH can use the old
> > BACKING_OPEN/CLOSE with a naive 32bit id allocator.
> >
> > [1] https://lore.kernel.org/fuse-devel/CAJfpegve9GMTRwvoA5y7AzUSD4e_EDJ=
FzsqhCVN8xQ+RjQ=3D+Sw@mail.gmail.com/
> >
> > What do you think of this plan?
>
> Hi Amir!
>
> Thanks for your detailed email.
>
> I think this plan/idea is smart and it makes sense to me, but I'm
> confused what the plan is for fusex.
>
> If fusex is going to materialize, then in my opinion it would be
> cleanest for passthrough in fusex to work via either:
>
> a) fusex is fuse-over-io-uring first. All or almost all (excluding
> interrupts, notifications, etc) requests go through the io-uring
> protocol. For passthrough, since the reply is going through io-uring
> (which bypasses the setuid security problems Jann identified in [1]),
> the backing fd and ops mask can be passed directly as a reply to
> lookup (eg as a reply compounded to ENTRY + STATX replies), which
> allows dropping the idr/hashtable, a bunch of kernel-side logic(eg
> fuse_backing_id_{alloc(), free(), lookup()}, fuse_backing_{open(),
> close()}), and a bunch of uapi stuff (eg struct fuse_backign_map,
> FUSE_DEV_IOC_BACKING_{OPEN,CLOSE}). I think this also would nicely
> simplify things server-side (eg server doesn't have to maintain its
> own map to kernel backing ids and release them on FORGETs).
>

That sounds good for FUSEX, but we still need to support
FUSE_DEV_IOC_BACKING_{OPEN,CLOSE} in FUSE so...

> or
>
> b) if fusex is not fuse-over-io-uring first, then imo passthrough
> passing back the backing id in the lookup reply (in the new + expanded
> reply struct) seems cleanest to me. Then there wouldn't need to be two
> separate registration mechanisms and the extra kernel-side logic for
> supporting auto-attach, or solve weird edge cases that might arise (eg
> races between concurrent opens in iocache mode and
> FUSE_DEV_IOC_BACKING_ADDs).

Same problem.
We need to support FUSE_DEV_IOC_BACKING_{OPEN,CLOSE}),
so we cannot get rid of the backing_files and separate mechanism.
However, we can replace its implementation with a hash table.

w.r.t concerns about auto-attach and weird edge cases,
I understand your concern, but my feeling is that after seeing the
patches, it will be easier to determine how much of a risk this really is.
So it is on me to show a POC.

>
>
> If fusex will be abandoned, it still seems like the entry reply will
> have to be expanded anyway (either with a v2 struct or by piggybacking
> off compound requests) for Luis's lookup handle work to land. If
> that's happening regardless, imo having inode passthrough reuse /
> piggyback off that infrastructure seems cleaner to me (but also
> unfortunately a lot longer of a timeline given the dependencies :()
> than adding the FUSE_DEV_IOC_BACKING_ADD registration mechanism /
> logic.

As you say, lookup handle and compound requests are a tall order.
As I wrote in my own review on v2, I'd rather wait for those over
v2 struct.

However, I still stand behind my claim that
FUSE_DEV_IOC_BACKING_ADD/DEL do not add much
complexity over the existing registration mechanism that we need to
support anyway. Moreover, Miklos suggested that we bite the bullet
and make this UAPI change.

>
> What are your thoughts on this? What is your preference?
>

Let me post a quick POC of FUSE_DEV_IOC_BACKING_ADD
and let's reassess our opinions based on these POC patches.

Thanks,
Amir.
