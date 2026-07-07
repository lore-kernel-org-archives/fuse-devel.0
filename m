Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC697426D0B
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449338; cv=pass; b=nCeeoKhutVPYCeeJSpysXVZnSzWCc99T2jQwpvznjwIHjkHZgnEaE4y9uaadDVJCaslshRe/mxaZgQF/VyqzrucjyP/bhcrCO55JYbTxoT7GT4vM9EGAVOKhphBq7sGfehM/uDPvcclnCi/vuoOJGIRddbTkJKv3ZHqWBHdecOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449338; c=relaxed/simple;
	bh=Sm1Ha/cdp0gEPKuYY5svXi0U6xdYi+e6UYNhY26NVms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3f2bz5MVtolrpeH/Cp0VSjyuXLP3YuV00gOJ1Y4CJbNUDZgQrEGNOf3ZQVzwF4PZS5Ya6xB6hXxKgJw2aBG07++8KzZ07qCuhpdFOl7MoOcHXvrwYOudWj1wAjDI/CeSmCWMhUsd0T741a/zYiRT81WZqdaelSaDH2LKTVneWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=TstswS4F; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="TstswS4F"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84780c95e2eso3779379b3a.3
        for <fuse-devel@lists.linux.dev>; Tue, 07 Jul 2026 11:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783449336; cv=none;
        d=google.com; s=arc-20260327;
        b=lRKxaPd0qUxGv2kiYUBhQ9fQJH5FOAI76Mh2X7Gehh4FgmpDfOHNovddJU1UcLlPrh
         mpwo9/tLEJYx+oLzY4/sVobdiV4HzOfQx/M/hNLQS8E7NCbeneOOFY3gtiE1pFThAr61
         5sCl3p3LrV8KE1x74lHETsW1yU5D80wjGY5VFpxTGBWSHYTehI0mWI2WW5TsAr+xlrnG
         v7dg19sFARuTaU2wO956Wk8Qns9GSZQlIR453XczYrj6tnBGXFsSTIurujpHfC7jFAFZ
         9G+h13GUMmRTHon3zG/hFc+s6cmLQTmGdGHUNzj3Na5Wz9kFjTx5vzFaKi+X1+wpg4v4
         N2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BLDyqjY/uVeAJp5z4niMzm0kWqHh9bj9lbZDR35EN3M=;
        fh=3ZSKCCk//lrm2i2wKWDEC0XO/x1tRUCK9tkaOrs+4Cc=;
        b=m18iiEbACuUS6KFHjbWaziGtfGvpVJOAhFdC0vcA1Cf3kHeeOanXCYDUOYoRuRewb4
         vSugzdNgtr6SGK3nlS3zks2lWf8QhLTYe0g9e+kcBnXYc3QvRBzp1fc3jM/rH6is7rNM
         j8Z/MhPCeeasxP/0R7hA1dSjGwsjAbgPKVV8ZJ7YBIY/+MIE/UnrkqmTZ4O4obcMN3qW
         AaMx8zhS05HESmw+xOyh+01QbeFMy4wtSmr+mMqxmS0DA3FGuUrkUgnq8ROvfsinIKEq
         63ZvyT3ruwRiOoa9bX5ZGaVNqu3m0yxbFIX4ASBM6WXB7nSRVoDpFfmq19hHMgpwBcUE
         /sZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783449336; x=1784054136; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLDyqjY/uVeAJp5z4niMzm0kWqHh9bj9lbZDR35EN3M=;
        b=TstswS4Fo5Ao9EkSYNdBO4mYPZTTVE5pI4cc7wQ4ub6t6vRttZ0f5XYEdR6TAm6FK9
         N/eoKgGm/fSu1nRxaDmd7i9iyB/uc0Ln7hj0kExON9GyKFvqSoIL7HdbYcZoBiRgUgHl
         wG/wqC95CxKz3lz7WLVUVcBdl70peHItMvw7OtY+cFuMVPut+Le59bqUVz9ywO9TWgIV
         ipFj2POTxkh97nhVIUZvg0QA3P4WDC0kuvTVLLnsqgK9jAytDYmxJ8te/88M93yUyue6
         ji1TvLOtBlKz85Afx7VHkOy8boItFuTi98Sbd1LcuwWfvR14FPSGGmXbYIxyYFxmrY/v
         nnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783449336; x=1784054136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLDyqjY/uVeAJp5z4niMzm0kWqHh9bj9lbZDR35EN3M=;
        b=Ser8x5wEmj3CFV0dGBlzXY3rpqRwgziYj1FI7xd8/UZLfscrOq/3pG/MsPFIZrtivV
         MNc8TxpxHd6z4UXaqqG/8RRQ6dDXT5ElQPT0u5d7J2uEAzruJBkGGJzVQj64GLIUBE6k
         +3JYSJq3KLSJwpSR65wknk50fy1/jFZE8SQOsIl93B8JIuMct5rKjrC3R6DjTp1kU4KL
         VCrTGusPI5UfHw++fTcEpo84MjJpI7iYEo+sO8PoByOm3BN/raQtkla47RE1+gsuY11K
         tlVGu30GEPNK8yYSsy8C4NG3/i0v+74G5Nf2mIiCFrhC7DRUDxEMsZnjrqreo6cr2AcK
         x6nQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOnjwY58qJ3/ll9vZVd5ZD1wZlh1HwtgdODrCravHZVEW4WfJvE0LtZ6ijWzOkmL7ji5JdYg5NVHG8@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy4jM7p+1yc6w2JC+O/G+HXUBClGcAEwxBPjflFofpOQrq6C7b
	SbxTyupdCGTLIzWkQfQk4a3CbEUflWkcLx5qzH0cKUTvux/C7BxvBAHzKgHW5y+oP2kCF2q9fMt
	0gyVEGnuDSqDu+BuBgxo6M/nqxsgy4uTmmwRWF2Sx
X-Gm-Gg: AfdE7ckinnGT8npjHdImQ+OPXQr0G04fKwDzRqyS+1qzPzPU6qm4sAAmqAboyHNZiUj
	iDe5LCEgltEJBZAvjBSqsBEPhOvoshcZ/ZlGWwJ/Ue3mTKWc6Spbmt/oPdeKjcX9id131GecD04
	onSlXycjmFF4vAYtZjE3f0TsNRpgUH5Xg2uHeqfzW6x5oO0XXkv9WvXTajXVRCx6rJ3ivDjnEO6
	VYzh0vilif+MJ1tVKb/EaRzYkVshXoZZu7/mhdhpa8f3GeJ8o3dObamQA73pynIKSxOUVJfwya8
	lAouRvgzRF8sbdwSa6wq7w/TLjOjRZiD+PpMrzQ=
X-Received: by 2002:a05:6a20:c5a7:b0:3b4:b24e:27a2 with SMTP id
 adf61e73a8af0-3c08ee3631bmr7716392637.31.1783449336227; Tue, 07 Jul 2026
 11:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706191309.2887515-1-xmei5@asu.edu> <20260706191309.2887515-2-xmei5@asu.edu>
 <CAJnrk1Z8uS=ZR9HPeuuUiHUcydE6OW9WkmnonqSchTnfmwhk+g@mail.gmail.com>
In-Reply-To: <CAJnrk1Z8uS=ZR9HPeuuUiHUcydE6OW9WkmnonqSchTnfmwhk+g@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Tue, 7 Jul 2026 11:35:24 -0700
X-Gm-Features: AVVi8CdsPtS6exApgyhrHcoPo7IUkcxUWLjCsCcbcTlZu6-y7xIEf5hVJABT7XY
Message-ID: <CAPpSM+QBNBw5efBV+Ne52JQ0CZMBneVGeQC6boGbvrj1Ykufug@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: reject oversized payload_sz in fuse_uring_copy_from_ring()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Weiming Shi <bestswngs@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 2:29=E2=80=AFPM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Mon, Jul 6, 2026 at 12:13=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
> >
> > fuse_uring_copy_from_ring() imports the payload buffer with length
> > ring->max_payload_sz but passes the server-controlled payload_sz to
> > fuse_copy_out_args() unchecked.  A larger payload_sz drains the iterato=
r
> > to exhaustion and fuse_copy_fill() hits BUG_ON(!err), panicking the
> > kernel.  Reject replies whose payload_sz exceeds the imported buffer.
> >
> >   kernel BUG at fs/fuse/dev.c:1053!
> >   RIP: 0010:fuse_copy_fill+0x6c6/0x7e0
> >   Call Trace:
> >    fuse_copy_args
> >    fuse_uring_copy_from_ring     fs/fuse/dev_uring.c:686
> >    fuse_uring_cmd
> >    io_uring_cmd
> >    __io_issue_sqe
> >    io_submit_sqes
> >    __do_sys_io_uring_enter
> >    entry_SYSCALL_64_after_hwframe
> >
> > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Xiang Mei <xmei5@asu.edu>
> > ---
> >  fs/fuse/dev_uring.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> > index 0814681eb04b..f6127c230dd9 100644
> > --- a/fs/fuse/dev_uring.c
> > +++ b/fs/fuse/dev_uring.c
> > @@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_ri=
ng *ring,
> >         if (err)
> >                 return err;
> >
> > +       if (ring_in_out.payload_sz > ring->max_payload_sz)
> > +               return -EINVAL;
> > +
> >         err =3D setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE,=
 &iter);
> >         if (err)
> >                 return err;
> > --
> > 2.43.0
> >
>
> Makes sense to me. Thanks for including the stack trace in the commit mes=
sage.
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
>
> Same comment about stable@ as in the other patch - not sure if the
> commit message has to explicitly include the tag.
>
Thanks for your review. To ensure it's backported, I'll send a v2 with
cc'ing stable.

Xiang
> Thanks,
> Joanne
