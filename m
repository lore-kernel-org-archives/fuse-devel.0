Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B006C381EAE
	for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413626; cv=pass; b=aDvjMsD5b4byjJAypm12CO9u1rG+1rUp5zeb3hLHUgpzqvNQiVhm65vc0e3f76I1gYehUk1RHcac6+sIKy7JHwKp/b15Q8TA6Y1WwmxL3+J/GGU/GQvVCCcJaoviLz/Kfs6dpWRyCN9dyWoGvnUb/YnHv7mMai2QCQPdRAT9wus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413626; c=relaxed/simple;
	bh=xakzeq5id78Z/Uqt2W5jU58Uyg9YaQypJq9wqXGUycM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVUNj7+pUrN+TI7WA/wStYGBKv4j5ZTFPplvtMil19ADRR4SN1wyg7yOM0F4jInOvDcgEN8tnt+01abPE0kPryiBW9CoMAtoPE8PBNLyPjtxxTf/luzoJf2PMsZ2sbCAY65P1HR55XHsr5eiVBwPYvcVumwca06EinIr1Wt+JaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gorg0Pmf; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gorg0Pmf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so1179115f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 12:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789413621; cv=none;
        d=google.com; s=arc-20260327;
        b=MqUVP42lULshJ/QQ4o99v36m6m4HR4k5lT3RvVx7bDdw2sWkJgrqPWUdq6+EN9nIQu
         v8CFhg9AdeibT7U5hTMrscrzXlM+Gtk33iytkVOISVQvAkmNCZFcdrYPSZkyK1AS+2oK
         8ptHBFCfTUVXi0eYSLQcJdIX7BKG+FRLDi2zcjKcC0zV7N4TyjZYPlFVDDELsUPiw+vx
         QHDgzztErM79MW2H6LMsoHY0bwuT96UjV9eWqqmm9cg36BMkeh8uLt+2jyCnK219Eg+G
         d86iWoCztCPkn0QtLkxiRtXagNGcVaQBty75S3dNpZXAJF0x9XSc3MqbPkGjmDLi4WlA
         u8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RToJfpqTIYj+TSAl56wnkXn/Ktuv55iQLTBkVkQVxAQ=;
        fh=IzKdYchEyTiJ26kL/BILSOG1IkkE56jJiHMs7fm6J98=;
        b=J1HdeLU8V5rKKNqP46VgULH2N9XqvHqiFHTSlc6DN4vvZT76eaLL6ycslwUyEklc5s
         7SzbIM6UoyZ4ZLG3HirDpNZKvaCXp3lHTe9nGq8wT+SOCdGOqUskH6NrFVi5S9y6XdNG
         7roH/vnu9XJBr3+z0Z0mfiWkMmV1luQOqSCnRv+A5gIJaAJWDs2yxE/t9jLPGj5ZI6lK
         fvzdhpmTVUD1lnU8Rz1TL+kJrIbB5hoU9VDaOX60kU/Jp75cqwFm7vrS3uRM1vjFCw33
         cTfN0F7jNJy8bHAsP42XsTW9VBm3eiWdwMMwcjTPYZ26IRxGjK49/1A18pa5PFyqM7Ez
         eV8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789413621; x=1790018421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RToJfpqTIYj+TSAl56wnkXn/Ktuv55iQLTBkVkQVxAQ=;
        b=Gorg0PmfHmrW6zbfb3AGWW6SDKjKRG86yUoToMn1QFHuRPHaTT5/M/gOikfRSXEPdj
         iTpV0D/L8VV72DXfRsFtUYwLKop4gLdjHkV1/euKn/XF+Qbi2k0MrwVAB4moi7H+ksEU
         zJGwKQNDzFF7PpkIXtTveaMT+Zim4O3fBHhqfZHY+jWHRvHPsY7XpRRpOL0EHFWM4irO
         MR7wNVfw4Kc58XuakNKHFfkzqKbgM9FabNYFUnTpt1b4qEABUE5aUPgQESjWVQxtFYhp
         9N9vOpy1ONfkLOgncEKhVB6jltPAjFRR0jGSVTxsfIvmXohiyncTTdSE3bAhsE30RzED
         gkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413621; x=1790018421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RToJfpqTIYj+TSAl56wnkXn/Ktuv55iQLTBkVkQVxAQ=;
        b=CnYrPmXTaI7Vp0jrF5xtHVGmLyAPJbjxKlwmK34rc0czYSpSeaX/HZC7YqWHoBSKvW
         J6jS5boH2Iw+v5e3+/P8CB0UkSSJWb352kU7rW74cAgc631jxAyItn+zvvYvDGecPibl
         izryvnQmc47E0XK2AwGVeG89phFb6eTFJA+jho7pFoI/Ny2Wicu8XF0pogu47WcIBNaj
         IdxhiqGmEWnWbAMqqDFOAdvvxnwPWaPgsDuvytNeKo9jN91LGR4SSTYXzhFMeDwKLSYI
         tmN0wPIeuN4hMpzxh1fH5WZXo1eB8e2kb7P3C4jDfDiDOCcWrovDWaht6GB2idI7dyYh
         5MmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR+kFRTNhbqmM2MYMUA6bPqpGRPbkWZvHPS+26DqAL0q4f4VIz7y1JGb6oUn03wtyR0A6O0LdvlvDD@lists.linux.dev
X-Gm-Message-State: AFuF++nFbuEezMNonthx90G2jhpmDkofTL+gaJf4H1ORNIAeAk5/7foi
	OKp/yC9un+y3VDaxNXKistDKVSfYpITEDqISqcigVn/e/s2jf40ZbgixIXbWjZhc029+OA6pSim
	x2vF2xMq6KC+iPla8LpyIv1plBVzoSIykzvZB
X-Gm-Gg: AYBFou1R3oQyomOnsCKg3O5mDTKDkoEMJgXN1kXOrbuxIS6fxUnU3hinM9lGw5RwqVW
	B0B1p2EAQfjIXkwu/8W/QKtPEGNKTmPRJAbmvtyFp6LgZhMttWJ9xj7xncGLLM74df0HvhPYGLk
	uH45guUU0OsQKmJgt5CIaDO3tqc+lhSlrPXUboHEXxmJnpttJjCrNfqzNEJxt1GELqa5ZBLOiZQ
	PCfgcX8CjOHiW3q7RheS7eI9pzRpMGTZ5/wyTRqLXIO3IZhUJ3g8NR5L9+X2AeVUcBH7JEl3gY1
	xWvRdUUAiHSsQ4JH9YGEUmDpLQxkb/rHFAbJt3kaQ+wFJDQONi0nNvlSgYXkS0oGCzM0axhIryt
	vjYfm0M0t2i+m+mCegMUWfCBL3CgG+AiajLlqm94=
X-Received: by 2002:a05:6000:616:b0:487:4a8:e853 with SMTP id
 ffacd0b85a97d-48704a8e88amr2218941f8f.12.1789413621130; Mon, 14 Sep 2026
 12:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <CAOQ4uxhbbfn7pnq3YNMKpYDAjyZXdZcJoBpnkzjJwOdeDw9jow@mail.gmail.com>
 <CAJnrk1aBBVOY_bi0s8-FZm9EST2NNePW7jkX3J7ygQ3vaer7Tw@mail.gmail.com> <CAOQ4uxi_bdgJV4P0sgWbvhoTEHjSOhSHS=NcSymHp5-bdC_tzQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxi_bdgJV4P0sgWbvhoTEHjSOhSHS=NcSymHp5-bdC_tzQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 14 Sep 2026 12:20:09 -0700
X-Gm-Features: AcwNN1VT4YJXomw_m6K_xFXbNQACsxT_M1yNqzMKI4PHHq0XbCPy_cX8UwU-MQQ
Message-ID: <CAJnrk1apXOpHuB3GrUy7BPn+Z-d0UoB2wrpDjHJZzM-v+Amy1Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] fuse: extend passthrough to inode operations
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 10:14=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Sat, Sep 12, 2026 at 12:37=E2=80=AFAM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > On Fri, Sep 11, 2026 at 5:56=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Sat, May 16, 2026 at 2:51=E2=80=AFAM Joanne Koong <joannelkoong@gm=
ail.com> wrote:
> > > >
> > > > This series extends fuse passthrough to support inode operations (g=
etattr +
> > > > setattr) and directory readdir.
> > > >
> > > > The existing FUSE_PASSTHROUGH mode attaches a backing file to a fus=
e inode
> > > > only when a passthrough file is open. This series introduces
> > > > FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode nu=
mber
> > > > mapping, which allows attaching a backing file for the lifetime of =
the fuse
> > > > inode.
> > > >
> > >
> > > Hi Joanne!
> > >
> > > I wanted to see how we can unblock this patch set
> > > (did someone say conference driver development?)
> > >
> > > The main contention point for me on v2 was the fuse_entry2_out API.
> > > And the suggestion to do a composite LOOKUP+STATX defers this patch
> > > set to the unknown future of fusex.
> > >
> > > My favorite solution to a problem is to avert it.
> > >
> > > The question is how to include the backing_id with lookup/readdirplus
> > > reply. The answer is that there is no need to include it.
> > >
> > > I have already discussed with Miklos changing the UAPI to
> > > widen the backing_id to 64bit and to let the server choose the id [1]=
.
> > >
> > > Considering the fact that FUSE_PASSTHROUGH_INO literally means
> > > one-to-one inode number mapping, it seems a bit idiotic that the back=
ing
> > > id (should it be widened to 64bit) be anything other than nodeid.
> > >
> > > The new 64bit UAPI is something like:
> > >
> > >  struct fuse_backing_map_v1 {
> > >         int32_t         fd;
> > >         uint32_t        flags;
> > >         uint64_t        padding;
> > >  };
> > >
> > >  #define FUSE_BACKING_FLAG_INO_ATTACH
> > >
> > >  struct fuse_backing_map {
> > >         int32_t         fd;
> > >         uint32_t        flags;
> > >         uint64_t        nodeid;
> > >         uint64_t        ops_mask;
> > >  };
> > >
> > >  #define FUSE_DEV_IOC_BACKING_OPEN      _IOW(FUSE_DEV_IOC_MAGIC, 1, \
> > >                                              struct fuse_backing_map_=
v1)
> > >  #define FUSE_DEV_IOC_BACKING_CLOSE     _IOW(FUSE_DEV_IOC_MAGIC, 2, u=
int32_t)
> > >  #define FUSE_DEV_IOC_BACKING_ADD         _IOW(FUSE_DEV_IOC_MAGIC, 3,=
 \
> > >                                              struct fuse_backing_map)
> > >  #define FUSE_DEV_IOC_BACKING_DEL         _IOW(FUSE_DEV_IOC_MAGIC, 4,=
 uint64_t)
> > >
> > > ---
> > >
> > > - Server calls BACKING_ADD before open or before lookup
> > > - fuse_backing is stored in backing_map hash table instead of idr
> > > - With flag FUSE_BACKING_FLAG_INO_ATTACH:
> > > -- If fuse_inode of same the nodeid exists, fuse_inode_backing is att=
ached
> > > -- On instantiate of new fure inode, if fuse_backing exists with this=
 nodeid,
> > >    it is auto attached the the fuse inode
> > > -- This attachment lives until inode is evicted (same as in this patc=
h set)
> > > -- requires FUSE_PASSTHROUGH_INO
> > > - Without flag FUSE_BACKING_FLAG_INO_ATTACH, backing is attached
> > >   to inode on open as today and detached on last close
> > > - The server attached backing survives inode evict and it is up to th=
e server
> > >   to do BACKING_DEL on forget if it wants to
> > > - BACKING_DEL only removed from the backing_file hash table -
> > >   it does not detach fuse_backing from the inode (as today)
> > > - BACKING_ADD to already mapped backing or already attached inode fai=
ls
> > >
> > > FUSE_OPEN reply does not need to include an explicit backing_id.
> > > It's enough to set FOPEN_PASSTHROUGH because the backing file
> > > is already attached to the inode.
> > >
> > > Similarly FUSE_LOOKUP and readdirplus do not need to change at all -
> > > server just does ioctl BACKING_ADD before the reply.
> > >
> > > For backward compat, FUSE_PASSTHROUGH can use the old
> > > BACKING_OPEN/CLOSE with a naive 32bit id allocator.
> > >
> > > [1] https://lore.kernel.org/fuse-devel/CAJfpegve9GMTRwvoA5y7AzUSD4e_E=
DJFzsqhCVN8xQ+RjQ=3D+Sw@mail.gmail.com/
> > >
> > > What do you think of this plan?
> >
> > Hi Amir!
> >
> > Thanks for your detailed email.
> >
> > I think this plan/idea is smart and it makes sense to me, but I'm
> > confused what the plan is for fusex.
> >
> > If fusex is going to materialize, then in my opinion it would be
> > cleanest for passthrough in fusex to work via either:
> >
> > a) fusex is fuse-over-io-uring first. All or almost all (excluding
> > interrupts, notifications, etc) requests go through the io-uring
> > protocol. For passthrough, since the reply is going through io-uring
> > (which bypasses the setuid security problems Jann identified in [1]),
> > the backing fd and ops mask can be passed directly as a reply to
> > lookup (eg as a reply compounded to ENTRY + STATX replies), which
> > allows dropping the idr/hashtable, a bunch of kernel-side logic(eg
> > fuse_backing_id_{alloc(), free(), lookup()}, fuse_backing_{open(),
> > close()}), and a bunch of uapi stuff (eg struct fuse_backign_map,
> > FUSE_DEV_IOC_BACKING_{OPEN,CLOSE}). I think this also would nicely
> > simplify things server-side (eg server doesn't have to maintain its
> > own map to kernel backing ids and release them on FORGETs).
> >
>
> That sounds good for FUSEX, but we still need to support
> FUSE_DEV_IOC_BACKING_{OPEN,CLOSE} in FUSE so...

I was hoping after a certain deprecation time period, all of that
could be dropped entirely. But maybe this is unrealistic of a plan
given how widely used fuse is... I guess the deprecation time period
would be like 10+ years.

>
> > or
> >
> > b) if fusex is not fuse-over-io-uring first, then imo passthrough
> > passing back the backing id in the lookup reply (in the new + expanded
> > reply struct) seems cleanest to me. Then there wouldn't need to be two
> > separate registration mechanisms and the extra kernel-side logic for
> > supporting auto-attach, or solve weird edge cases that might arise (eg
> > races between concurrent opens in iocache mode and
> > FUSE_DEV_IOC_BACKING_ADDs).
>
> Same problem.
> We need to support FUSE_DEV_IOC_BACKING_{OPEN,CLOSE}),
> so we cannot get rid of the backing_files and separate mechanism.
> However, we can replace its implementation with a hash table.
>
> w.r.t concerns about auto-attach and weird edge cases,
> I understand your concern, but my feeling is that after seeing the
> patches, it will be easier to determine how much of a risk this really is=
.
> So it is on me to show a POC.
>
> >
> >
> > If fusex will be abandoned, it still seems like the entry reply will
> > have to be expanded anyway (either with a v2 struct or by piggybacking
> > off compound requests) for Luis's lookup handle work to land. If
> > that's happening regardless, imo having inode passthrough reuse /
> > piggyback off that infrastructure seems cleaner to me (but also
> > unfortunately a lot longer of a timeline given the dependencies :()
> > than adding the FUSE_DEV_IOC_BACKING_ADD registration mechanism /
> > logic.
>
> As you say, lookup handle and compound requests are a tall order.
> As I wrote in my own review on v2, I'd rather wait for those over
> v2 struct.
>
> However, I still stand behind my claim that
> FUSE_DEV_IOC_BACKING_ADD/DEL do not add much
> complexity over the existing registration mechanism that we need to
> support anyway. Moreover, Miklos suggested that we bite the bullet
> and make this UAPI change.
>
> >
> > What are your thoughts on this? What is your preference?
> >
>
> Let me post a quick POC of FUSE_DEV_IOC_BACKING_ADD
> and let's reassess our opinions based on these POC patches.

Sounds great, looking forward to seeing the POC!

Thanks,
Joanne
