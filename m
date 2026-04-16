Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968CC3D47BF
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347382; cv=none; b=SWvPfXghNTF/M4y/Ne85RLEAuR9ClWPOJ7Wmsko1sQM1ifaMiJD4d/jkRzGusF4J0Mdj3QngYizKZU1/XOXph5k3SE7jVNlBu4uSVZ8CEGFm7dMuci8eOXEjKRnsDCw4D3tEUeoAaWyvfLiDsX41ZFcKXFABfHq8/lQV/0EEmyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347382; c=relaxed/simple;
	bh=Z0i7dR1qW8QN1sVk3QQ5xgZCNm5RCBy7MydE8xtg/rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JfXSKhVQUR26t1HNRrM93A1Al6b6SJJlJn/H4GDg/+FkQ+aye+OIiPK0PFO3FILo8853M+tRhMoUIB4KxandSZ990+THNk5gni7Bm/JPSPG7iWtU7q7JaaI1AymE0ny7PRHRN5PEF1wrWAmvwGJ230mr2zp2xH54dg0HuXwsKJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cf62XgbF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cf62XgbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776347378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8FEgUgpQ2ISixaYIydOnHi/p4L1N5t+4Tzt+CMNzn0=;
	b=cf62XgbFlDSEuaUI+fjgr0UJxMImJ2b2+GSCtbi8yjbOQvKR2S7z7aGWS3qoDaQgG0nV+d
	/i0ThyMUoD9CossCuu63rJ7WZMZ9/97pzxkU85/KljVMUKVdGJs4uUvztFvv0Fh3Tn2Dss
	QjSiohOtOJtLyFClSdy2trKloM5+v/Y=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-IruyFRuwMza5FKU_FH2qZg-1; Thu, 16 Apr 2026 09:49:37 -0400
X-MC-Unique: IruyFRuwMza5FKU_FH2qZg-1
X-Mimecast-MFC-AGG-ID: IruyFRuwMza5FKU_FH2qZg_1776347376
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953b90636a7so13231257241.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 06:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347376; x=1776952176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8FEgUgpQ2ISixaYIydOnHi/p4L1N5t+4Tzt+CMNzn0=;
        b=Py0ZeOV2oglL8RLCPWQlbkya2JxsJPZXSBaCxchyi0OtwFt32yn5cVEX7xLy5Tb9fs
         nZvkZpBUwGt7hQD3uaQOlqrt1hjAkZOUV5wlFIPvTZuL779ZOZ0EK223k4mq+NuzwI+o
         auFfOYfupoY3lVmISvVswE5ozuCU+2dYuUWFxffwm5fU/1E5X35vccJM9BPVOL3aberW
         p95f/8bzvp3/6YRlTGLxOnf1peoucHwtA9q74ImJyvxz2UqJIzEUIPZq7fqj2A2IdD/g
         qMlc81UN+ssrM0RgFvCY5b9LDN3G0jWGT5/zAawp0wiUym3Fyi1WI4QgcrIbiYOjrMQK
         Baqw==
X-Gm-Message-State: AOJu0YyFPeqmO27+dGxpXL2rIvulOgdVePUPcO6GLVy0QBEempiqlI8u
	W6USltHByZUCvx24xPtmyxgUdM0pQBa+Wr8ilx8LchqkufymBxcUO8SiF1kKhM9lEoFscVfRpIm
	qHivXb4VyiiVshw4QjQTuhCxitUcNRsCVlnjqqww5VrBZIMUkuwVE/2KqMlxi5aVHiQkr0fuo0i
	SIvR7tsWQlCc8RD+NE6GQMmzLy6g0tobj40BvYpA==
X-Gm-Gg: AeBDievCY/ryEAHkH6GcInS9RolSDcHD2cKZsJs6qu/aAbnuNwJQgE57jQ9XyVqFz2S
	4FI3FsI0JrQEXk5aeBoks5lWCt8iHcdVCInmfV95LGpGFeZB12lDjfxY/p/wzBLn+kjmIZQJ11M
	Zh1zZMHLf1CpcnJDF1jbwlSXSb6sazwsLWq+c6JYsDU7h0/eZB/0hhLRT37YE/LZoBy3Elj+5U5
	3glYZhv/dhePCGgVHuC80RtLYmeHOqoA6DiUxy8l0YrcZt+Gp0=
X-Received: by 2002:a05:6102:5ccb:b0:611:b9be:1199 with SMTP id ada2fe7eead31-611b9be29c9mr6055072137.14.1776347376363;
        Thu, 16 Apr 2026 06:49:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:611:b9be:1199 with SMTP id
 ada2fe7eead31-611b9be29c9mr6055049137.14.1776347375919; Thu, 16 Apr 2026
 06:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <18936160-308a-4817-a295-54eef43707a3@niova.io>
In-Reply-To: <18936160-308a-4817-a295-54eef43707a3@niova.io>
From: Ming Lei <ming.lei@redhat.com>
Date: Thu, 16 Apr 2026 21:49:24 +0800
X-Gm-Features: AQROBzCIol7RE0DDxLQaR6r4Mq7i-AWBn2vORSsKLH8h7_cokENW_lNLW9f-hKA
Message-ID: <CAFj5m9LeM4S82QEsRQ0uQiXj1eWCFAW3v2fLTxUj1YM7UO-V9g@mail.gmail.com>
Subject: Re: fuse/io-uring: Proposal to support pBuf in additon to kBuf
To: Bernd Schubert <bernd@niova.io>
Cc: fuse-devel@lists.linux.dev, Joanne Koong <joannelkoong@gmail.com>, 
	io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	"Lei, Ming" <tom.leiming@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7pXkMeNSBpZ3uCSOgexDZgFESRNzH8kucE-_9VrqfSk_1776347376
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bernd,

On Tue, Apr 14, 2026 at 5:33=E2=80=AFAM Bernd Schubert <bernd@niova.io> wro=
te:
>
> Hi Joanne, et al,
>
> this is a bit of duplication of the discussion we had before, but I was
> badly distracted with other work and also switching employer - didn't
> manage to reply [1].
>
>
> I'm still not too happy about kBuf and its restriction of locked-only
> memory. Right now I'm reviewing your patches from the view of what needs
> to be done for ublk (for my current employer) and also for fuse to
> support different buffer sizes. Let's say fuse only support kBuf and its
> restriction of pinned memory, I think we would be forced to add support
> for different buffer sizes to the current ring-entry-provides-the-buffer
> and the new kBuf interface - from my point of view code dup.
> If we would allow pBuf for fuse, we could put the current
> 'ring-entry-provides-the-buffer' interface into maintenance mode and
> support new features with the new interface only. I know you disagree on
> using pBuf [1] with the argument that userspace could free the buffer.
> Well, if it does, it does something totally wrong and the same could
> happen today over /dev/fuse and also the existing fuse-over-io-uring.
> Just the window is smaller, as the pages are extracted from the buffer
> during the copy.
>
> I was looking into what would be needed to support pBuf and I think
> io-uring could extract pages from pBuf when the buffer is obtained - it
> would limit the window when userspace can do something wrong in a
> similar way current fuse and ublk works.
>
> Suggested changes:
>
> io_uring:
>
>   - io_pin_pages() gets a 'bool longterm' parameter.
> The new pBuf path would pass false, every other exsting caller true.
>
>   - io_ring_buf_pin_user() / io_ring_buf_unpin_user()
>   - io_ring_buf_get_pages()/io_ring_buf_put_pages() -> fills the
> provided bvec
>   - New struct io_ring_buf (in cmd.h)
>
> struct io_ring_buf {
>        size_t                  len;
>        unsigned int            buf_id;
>        unsigned int            nr_bvecs;
>
>        /* private */
>        u64                     addr;
>        u8                      is_pinned;
> };
>
>
> Fuse changes:
>
>   - fuse_ring_ent (bufring union side): payload_kvec and ringbuf_buf_id
>     replaced by io_ring_buf + pre-allocated bvec array.
>   - Buffer selection under queue->lock removed.  The lock only protects
>     request dequeue and entry state transitions.  Page access happens
>     after the lock is dropped, in the context where the copy runs.
>   - setup_fuse_copy_state bufring branch: is_kaddr/kaddr replaced by
>     iov_iter_bvec() and would continue to use iov_iter_get_pages2()
>
> What do you think?
>
> And my current primary goal is to let ublk to support multiple buffer
> sizes - ublk would also need to get support for kBuf/pBuf and I'm

Ublk server is just one liburing application, and it supports all generic
io_uring buffer types, so kbuf/pbuf should be fine for your ublk server
in theory.

It really depends on how your ublk server is implemented.

Maybe you can share your motivation first before discussing kbuf/pbuf suppo=
rt.
If it is for DMA,  there are other candidates too, such as hugepage,
recent added
UBLK_U_CMD_REG_BUF, ...


Thanks,
Ming

