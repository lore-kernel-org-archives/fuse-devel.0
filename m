Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC273D5221
	for <fuse-devel@lists.linux.dev>; Fri, 11 Sep 2026 22:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166281; cv=pass; b=herNXzjPya9gF5Q86tmRTqE54J+SpvongMu6voT5k7CJhM6ET0m+OhpJ49gdtFAHGgawS6Ri6rYJdPVVeKpByh49w8UPozMuUnWcStpKikWbuj2SKTErPiJmJ4VwuRxLf/1jA/ablsnPZBo52AoCaLcjWJYKklt/Pv5Trv+2pkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166281; c=relaxed/simple;
	bh=fAQ57UM8Ut+gTpCHkm0nB+q9GoOd0B/RFpTXH57H3dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsT1iCa1NPrVUGSs0t4B2vr/8M9TKbrHR2E8mRR8zUd8aDcysc4rPqg3HarKb80ZdFibrw8UqHeBi+bcmfpeatr/bkAMZNh4lQVJlNRAPYBdlCAN6y+SnmAWKSqn4B/KjSmnWDmPwZACl+kfVrWuIqjswztsntXA92NcnMW1hv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCD1q269; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCD1q269"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so179179f8f.2
        for <fuse-devel@lists.linux.dev>; Fri, 11 Sep 2026 15:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789166278; cv=none;
        d=google.com; s=arc-20260327;
        b=rVzC/RNDjA/YO/qk6/JNJ4QOELmzr+qBZbisj9Gk8sd2ka2mVvncNedg5RFof5vfd5
         hY10jxWp/W5kiYlX7KJ+aGPiITdCILCGzPeo0N4O8hIvxh2mfam0EnDrI2qQHi4tYq5J
         z8Qk9yXGJVdysixiWdEOnsSDLCT3tk0B41l407bhY2lJ7QIuV+ADlwFZnR+frJWJrMkR
         0W2GTNLwfpsmULbSm2th2o9k0oR/vx8uTMxSaYhV2PVGIcBeqqZa337ebkbFZ16D/VL/
         yU+pqmq8OlftRm4gHS3t93+Y9HtHGislDLoyjv7xEFTI5Ia8+zYtIsA67v5PjFGOgisJ
         Wbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2C/u/+Db/N6QJbNwjbEuOzl+1ZJl0iDu5MsAK9vhCFw=;
        fh=vdU0bCIH+ww1kmcqp3JHS8H/6dKQKXpn+agWNsnXRMw=;
        b=LZm8tp+F0hM2O1HJZbpgp3d65RgYJO4iBr9S8ZqdPO9N3n5yYG1njxIFCSWL/YfGst
         iNByz/eGuUFZjKtOW9dWUrwZf9Vj2Do4asS3+ZS4HdS7uutARwm5Y8cgbpWclzjuenMx
         rMaNfEmB3tQlQAKFrUsh8+SYkX+Y2hzWEwwQ/ooWSS5YCfUBt4LoOlCaoR01o6J9e424
         d2+4d2U7y9UiypE4wNzEcEEsIqt+fb3lfXI04JU7k1Lp49hHTtjOYLQeApxMHLbuUKgA
         4+EaNP0XknEcBQSxPc+gmfdt5veFxp7Z+dpL52jgMTRTMHrDCy+wThwDDrXbvYiVhnDZ
         P4JQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789166278; x=1789771078; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2C/u/+Db/N6QJbNwjbEuOzl+1ZJl0iDu5MsAK9vhCFw=;
        b=iCD1q269VwE3+l6exfSBuOmqH9m0lBIiL4EMvA867ojVMy2Pwt6988KhkuTQs+PBqv
         IAggpY1hVKwJhCmz/d4t08HKAT4YBT/4g3g5/D08NSimsiwSrA4FBexUVF1qapRtlJOe
         3KNymly5txc2duCe1nBqtslW5WZHtnnPgto/8kZ0bOgODnxUnlHbboJyKkd2ave09RNv
         cyCmuhOVqRfEH+decKzxMq0MmBnOncD9P6s3objKQedk4pUMnoE9+Yy7UMtMf/y0qLFO
         uyWB18TX1b68mvY61SGWyHZFAKTsG+vDaMzJ/j6cVBP4x47wQT775FDZ8NQMDHQ/bS7K
         +unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166278; x=1789771078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2C/u/+Db/N6QJbNwjbEuOzl+1ZJl0iDu5MsAK9vhCFw=;
        b=nkULO+3GmvmqdAwLR5Sc/FYCRP/MLiXgFNNhC3UJ/BEm6QbaBF37j/L5wZoVPUJG2H
         WsSnH0aUI05oRYBdbWXwv0RzH1bfhz43dyV5yOhcN0rgebvWfn8jz79DDlh7TBFWrnw3
         H4ceREt1vo1Bz6rrKSe1Phi2UCO1/Hip1S6jWq9ddyJw0QGOhZYHlS8C6pgXYZPk7JwU
         wR4eC1lqbwlxpHV6H4ljRyFcya3o2/dqyyNIxg3n6G26zefZtnguvfg++k+B369hJMrO
         20gtz5rKF+3BNytquHXycd0+zyXoZom0l4hp/49offwe374Svf3v+szvpdC2ZJ5Imwe9
         1sbw==
X-Forwarded-Encrypted: i=1; AKwUvBw6SbTS+jYKgqq18cRTCDkwrh8hZscr+dJjTP4wz7Sm/3Zws0ehj+iH4csznYluFApEgY29xsjUiZ5I@lists.linux.dev
X-Gm-Message-State: AFuF++mls+5hxhbO3AURVUiWfMldPtlwhM8LRWEOWpsZxtCxkETNtGty
	D2Ba9AMwD7HiabB/yKuWHM/HtxZ+/0jByMt7iu1HzghbPiKITlJGQ+Ze4LN2R3el6wtb+M+Gr/a
	tJKyJCqV7mF/uWCiOfdd+WWqp0VXweEo=
X-Gm-Gg: AYBFou2AdlGosVTAB+alBMEBQSLo/aoRf8KejZFjfWsnltvGug9nYDrC0QcEBL1NngU
	Wz0ERBCYOzuD+d8a6Q7VtZWZi678VCkBhlgqBuDi87tQTgmE7Xw3SFGiC5aUwBo/SA1iuIXtiFS
	wh/Zpdfq89lXKoJ9ExqUoeeQsLoujH2nLgfb5zaF4rTHK5nXi7m+a/RnMSiXND5w7BRZjuNjECr
	FxxzyJ1mZVpb6NpfEdQYlRs2WQC/rpR8drxlhwDlVCkOpXKwB2na2l+/t23bvssj0MWD1tLU8o6
	RodAGVhBtxCp7U6xoVSXP5nTukAWEChce5JEU47+ACTFlTKySS5dIVOmy7axNPMi/Iop8a+JAAT
	yOgn2Y60kP/WOeUkl7MlckfFSXXQLABgHHSmV4w==
X-Received: by 2002:a05:6000:29d8:b0:486:f4b1:8c4a with SMTP id
 ffacd0b85a97d-486f4b18d31mr3477162f8f.10.1789166278133; Fri, 11 Sep 2026
 15:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <CAOQ4uxhbbfn7pnq3YNMKpYDAjyZXdZcJoBpnkzjJwOdeDw9jow@mail.gmail.com>
In-Reply-To: <CAOQ4uxhbbfn7pnq3YNMKpYDAjyZXdZcJoBpnkzjJwOdeDw9jow@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 11 Sep 2026 15:37:45 -0700
X-Gm-Features: AcwNN1XM9lXWFvwHUJVKCKA37U20dCm8sizz9HYVpSbmw9jZoH5lqCCqd8qTAuc
Message-ID: <CAJnrk1aBBVOY_bi0s8-FZm9EST2NNePW7jkX3J7ygQ3vaer7Tw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] fuse: extend passthrough to inode operations
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:56=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 2:51=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > This series extends fuse passthrough to support inode operations (getat=
tr +
> > setattr) and directory readdir.
> >
> > The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse in=
ode
> > only when a passthrough file is open. This series introduces
> > FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode number
> > mapping, which allows attaching a backing file for the lifetime of the =
fuse
> > inode.
> >
>
> Hi Joanne!
>
> I wanted to see how we can unblock this patch set
> (did someone say conference driver development?)
>
> The main contention point for me on v2 was the fuse_entry2_out API.
> And the suggestion to do a composite LOOKUP+STATX defers this patch
> set to the unknown future of fusex.
>
> My favorite solution to a problem is to avert it.
>
> The question is how to include the backing_id with lookup/readdirplus
> reply. The answer is that there is no need to include it.
>
> I have already discussed with Miklos changing the UAPI to
> widen the backing_id to 64bit and to let the server choose the id [1].
>
> Considering the fact that FUSE_PASSTHROUGH_INO literally means
> one-to-one inode number mapping, it seems a bit idiotic that the backing
> id (should it be widened to 64bit) be anything other than nodeid.
>
> The new 64bit UAPI is something like:
>
>  struct fuse_backing_map_v1 {
>         int32_t         fd;
>         uint32_t        flags;
>         uint64_t        padding;
>  };
>
>  #define FUSE_BACKING_FLAG_INO_ATTACH
>
>  struct fuse_backing_map {
>         int32_t         fd;
>         uint32_t        flags;
>         uint64_t        nodeid;
>         uint64_t        ops_mask;
>  };
>
>  #define FUSE_DEV_IOC_BACKING_OPEN      _IOW(FUSE_DEV_IOC_MAGIC, 1, \
>                                              struct fuse_backing_map_v1)
>  #define FUSE_DEV_IOC_BACKING_CLOSE     _IOW(FUSE_DEV_IOC_MAGIC, 2, uint3=
2_t)
>  #define FUSE_DEV_IOC_BACKING_ADD         _IOW(FUSE_DEV_IOC_MAGIC, 3, \
>                                              struct fuse_backing_map)
>  #define FUSE_DEV_IOC_BACKING_DEL         _IOW(FUSE_DEV_IOC_MAGIC, 4, uin=
t64_t)
>
> ---
>
> - Server calls BACKING_ADD before open or before lookup
> - fuse_backing is stored in backing_map hash table instead of idr
> - With flag FUSE_BACKING_FLAG_INO_ATTACH:
> -- If fuse_inode of same the nodeid exists, fuse_inode_backing is attache=
d
> -- On instantiate of new fure inode, if fuse_backing exists with this nod=
eid,
>    it is auto attached the the fuse inode
> -- This attachment lives until inode is evicted (same as in this patch se=
t)
> -- requires FUSE_PASSTHROUGH_INO
> - Without flag FUSE_BACKING_FLAG_INO_ATTACH, backing is attached
>   to inode on open as today and detached on last close
> - The server attached backing survives inode evict and it is up to the se=
rver
>   to do BACKING_DEL on forget if it wants to
> - BACKING_DEL only removed from the backing_file hash table -
>   it does not detach fuse_backing from the inode (as today)
> - BACKING_ADD to already mapped backing or already attached inode fails
>
> FUSE_OPEN reply does not need to include an explicit backing_id.
> It's enough to set FOPEN_PASSTHROUGH because the backing file
> is already attached to the inode.
>
> Similarly FUSE_LOOKUP and readdirplus do not need to change at all -
> server just does ioctl BACKING_ADD before the reply.
>
> For backward compat, FUSE_PASSTHROUGH can use the old
> BACKING_OPEN/CLOSE with a naive 32bit id allocator.
>
> [1] https://lore.kernel.org/fuse-devel/CAJfpegve9GMTRwvoA5y7AzUSD4e_EDJFz=
sqhCVN8xQ+RjQ=3D+Sw@mail.gmail.com/
>
> What do you think of this plan?

Hi Amir!

Thanks for your detailed email.

I think this plan/idea is smart and it makes sense to me, but I'm
confused what the plan is for fusex.

If fusex is going to materialize, then in my opinion it would be
cleanest for passthrough in fusex to work via either:

a) fusex is fuse-over-io-uring first. All or almost all (excluding
interrupts, notifications, etc) requests go through the io-uring
protocol. For passthrough, since the reply is going through io-uring
(which bypasses the setuid security problems Jann identified in [1]),
the backing fd and ops mask can be passed directly as a reply to
lookup (eg as a reply compounded to ENTRY + STATX replies), which
allows dropping the idr/hashtable, a bunch of kernel-side logic(eg
fuse_backing_id_{alloc(), free(), lookup()}, fuse_backing_{open(),
close()}), and a bunch of uapi stuff (eg struct fuse_backign_map,
FUSE_DEV_IOC_BACKING_{OPEN,CLOSE}). I think this also would nicely
simplify things server-side (eg server doesn't have to maintain its
own map to kernel backing ids and release them on FORGETs).

or

b) if fusex is not fuse-over-io-uring first, then imo passthrough
passing back the backing id in the lookup reply (in the new + expanded
reply struct) seems cleanest to me. Then there wouldn't need to be two
separate registration mechanisms and the extra kernel-side logic for
supporting auto-attach, or solve weird edge cases that might arise (eg
races between concurrent opens in iocache mode and
FUSE_DEV_IOC_BACKING_ADDs).


If fusex will be abandoned, it still seems like the entry reply will
have to be expanded anyway (either with a v2 struct or by piggybacking
off compound requests) for Luis's lookup handle work to land. If
that's happening regardless, imo having inode passthrough reuse /
piggyback off that infrastructure seems cleaner to me (but also
unfortunately a lot longer of a timeline given the dependencies :()
than adding the FUSE_DEV_IOC_BACKING_ADD registration mechanism /
logic.

What are your thoughts on this? What is your preference?

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/CAG48ez3ZX8R9kRAQhung2_e3wjowu5cP=
h7WL3U866mkga-kftQ@mail.gmail.com/

>
> If you are on board, do you want to take the lead or shall I try to alloc=
ate
> the time for it?
>
> Thanks,
> Amir.
