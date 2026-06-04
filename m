Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8664C956C
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 17:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595891; cv=pass; b=kiS5rv4i7Y/E9u/REDKBUnvqwP8NduPA+V2f1RtYEEMS1HP2ACSgmLdpXqM3Ncw4idLm57Ed+HnQ9384trf7tGTiC/ms2IEqI4XU+MQhBtQWRMfoyvNnJSbO0CBu9/q+BwARRRNIkQ3wV4waH9MgZmpP5ZbZAP7qMJddTEuuAuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595891; c=relaxed/simple;
	bh=JDBpdTmRiGxd26FL0xwA8RefNqMqJp531Ox8iOS35AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2od7HPJUwzeHc3O9fx49qalVVhHn79D1Q+Srn7lpN7mEBBFQy0lL9Bd8kdiA6C+CpMo1dIOEN/kqyUVheh/21oxH1fAt6SJB8wrA8I0CNPlkgYrfpG4ZqSHwQr8IgTZBNA0MMMEb23AuI8oJd00m7bXpHzAUBbYNYZLBeswy10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHKpx1EI; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHKpx1EI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so8920015e9.0
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 10:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780595889; cv=none;
        d=google.com; s=arc-20240605;
        b=dQ3itKYZBWnbSGfiv1KY4ar5phtgBaYN/7Rur90F6l59pXa3OJvmeLVqTJwf/56E/y
         emJ587r4C9j735JNEBQSyHEY0t78Xt/q3H2dyP6Io5/bymrpmwo+37TXs0HvUOwaGvwd
         Ad27C6d3Y2bDeW+QZMC88Fe1Rt3WdWanVWzHnBuxDMBi4g4uNJtLEGWgLCRiMhgvp8r4
         YcNSsinYXYg0qc3GwiLnqEDaCLc+7uVYxZyyWNFK437An1iovfcUVNOR4fGJukfba1Ae
         GwdAynz7qQ75rwd89pPCilPhWiucT1AnEZW14Sf2Jlf3vAHhlvcJI1h8hOCE06Bvrl/c
         m/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xF2MKm39aUuVQQhyZRtRX7LK9+Sor0h95VyMNxKj3ak=;
        fh=UBiMk7QZrgViINnDzR4UrJl8x4A79HnBf1jgJFlpO7g=;
        b=kkEFFkdCcYv3oAlSSGCK7yx4pyjrHNKrdq3qk/AK4XcKGh+PvNPi63G+rm2zsum/ab
         VPnn/IUcxJOOawnP00AIns/jtqf4QqsvXjNmJFg+rpxPtcFUrzaAN1Dt6Kym7qP4ksC0
         SqVLs5KRsFUA12sUp1EQt7Izzx0k98zP4KAck+H6y9sFnNPjILFd6zHjjdSokhGKpQOC
         2ByGD26dxhvxA2pcUILdxPwPYq0/FvShwrXR+QkSt/eu/eZLQ6OzrGew1+uA6F0aZ3ct
         e7FLRzSPNvIzYS7bJ49In8xwadfoPx1Ce9zOiuTQA8A/7GTYow0LP0fgqL45MQ48tr3K
         VOnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780595889; x=1781200689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF2MKm39aUuVQQhyZRtRX7LK9+Sor0h95VyMNxKj3ak=;
        b=XHKpx1EIJFNp9/2IoK+at0iXxazYOrGyHaRvWgfrDhhTsNGuETAwIgt5wUOaiDLmIT
         fz2oGzfp3h8/Hv+kID+909WwNcnkkr7jopLD5oUojjVOTr6+O2O0IfbaqRUV2OSn+zel
         TxpCbnn23KDbH80eY1z5PEi0gUuE7tannmPZ0pEQSpmmpOLBq/N9ud4Cv8vZRs/r06ba
         ExQDADAas551Kr3EHlexSvBDQz9q80/XZiQKjtLumeWKhSedvSbiV+o7DMEaznZLzThy
         50WY6rD7TGjRNvcSJabxDl59K7ky0bIUeieZuFs9BcdeyIVzpO4ZhdqSHwPjMbmFZH67
         rKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780595889; x=1781200689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xF2MKm39aUuVQQhyZRtRX7LK9+Sor0h95VyMNxKj3ak=;
        b=gvp10RqdVBxpQ5Q3FTcP4f3g6EAgOwYbCjVotoOt459/QZDEPB3zpoot1ML4R4IjIh
         QP9kJYPDxvP6z8dF2fPKV5/RSL+NExuKiXBkHr5bo4lqd8N0FSCeLGUsi9xMRVyORrU3
         Fx1yrSgQobcNq2TH9auqc3QkaslhzfFe1NCmXEpJyL+L6C41rx7kOCebrZGd/2dElTed
         w7o9FphPnfxMSdUBa0h4GEic6A0ylDyeD5Yl/qOGrPet7Ziuuw0VWF+CFbbfgk5/BbhS
         edHhrgCUs01IgSOuJ7g7rq8PZIxL0LHxPpIyrF0LLij2OcG3LJPRdoYxUq7JWHGfXtsp
         Vx/w==
X-Forwarded-Encrypted: i=1; AFNElJ+ZJnJrEY2NFJXFAsyE30bOU6MXj48/Bqkv2TbHoSLWGLy6pP6l7WRa3aa5OBk3puNvd/uAa2TJ1l/O@lists.linux.dev
X-Gm-Message-State: AOJu0YzL+5k45SKs5bEw9wzV8h/4Stckr2sS/dnBvpYVW8Xb1CTAstgI
	ySWU77mM3QhdHu+ZjvTvixtBbDgAyr8U9UD6TGf3B0BBWJpUy0jCA/kShQx9DqKO+ek/WGGe4t4
	VsrW0Kc26buyJyasPjEOTRXNKCmzoSPWeEXKb
X-Gm-Gg: Acq92OGaaaTUeOk4tETmnlNvspAE+GAkIXLzcGjhBDVeYOG6bFctxCBvfRuJdNtZEPp
	pUhHhwx8VMMNIP2kjWAnvzMmGgZrZFvsDzmPrv2LxVZhxCiCqyDYafr2S/k8ronkYKCSRiSqakM
	ZbHDKeMBPShg+0NKb8gl67ZJQh5/M21kWucopb1LWmdt6ZcY5vNFg81wTKCvjY279PraUG01e6V
	hN7qjQaprFLFc9vUN58UArKcSN2zjVsxuX9mcp9b9QJn4u+vBPkBWwGX/GL9r/pG0JK7pbwDBpn
	sQBzrBNIGtdX9MOE
X-Received: by 2002:a05:600c:c103:b0:490:9bc2:bf8b with SMTP id
 5b1f17b1804b1-490b5e79656mr113878435e9.5.1780595888742; Thu, 04 Jun 2026
 10:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178059213410.15421.10567268398539539875@gmail.com>
 <CAJnrk1YH_SC9doHp60Vuajc-mzQiopPExMPQVVDtFHzB8vTM6Q@mail.gmail.com> <d486fde6-c78d-4a78-8dbd-43b8afaa90cd@ddn.com>
In-Reply-To: <d486fde6-c78d-4a78-8dbd-43b8afaa90cd@ddn.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 4 Jun 2026 10:57:56 -0700
X-Gm-Features: AVVi8CdEoBMunfXMb21c5leIrwhYiBa4AbRAQKWLZIRv0EOU_e4f9mYPVnGRF7I
Message-ID: <CAJnrk1YTqVMg+-giph=YH8UCJjsfG7uLSPSK-68G0h=WC2sXDg@mail.gmail.com>
Subject: Re: [PATCH] fuse: {io-uring} use request cleanup helper on commit
 setup failure
To: Bernd Schubert <bschubert@ddn.com>
Cc: Shuvam Pandey <shuvampandey1@gmail.com>, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	fuse-devel <fuse-devel@lists.linux.dev>, Zhenghang Xiao <kipreyyy@gmail.com>, 
	Berkant Koc <me@berkoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 10:36=E2=80=AFAM Bernd Schubert <bschubert@ddn.com> =
wrote:
>
>
>
> On 6/4/26 19:33, Joanne Koong wrote:
> > On Thu, Jun 4, 2026 at 10:09=E2=80=AFAM Shuvam Pandey <shuvampandey1@gm=
ail.com> wrote:
> >>
> >> fuse_uring_commit_fetch() removes the request from the processing
> >> list and clears req->ring_entry before moving the ring entry to the
> >> commit state. If fuse_ring_ent_set_commit() fails, the request is
> >> currently ended directly with fuse_request_end().
> >>
> >> That bypasses fuse_uring_req_end(), leaving ent->fuse_req pointing at
> >> the ended request. A later ring entry teardown can observe the stale
> >> pointer and try to end the same request again.
> >>
> >> Use fuse_uring_req_end() for this error path as well. The helper clear=
s
> >> ent->fuse_req under the queue lock before ending the request, matching
> >> the other io_uring request cleanup paths.
> >>
> >> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support"=
)
> >> Cc: stable@vger.kernel.org # v6.14
> >> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> >> ---
> >>  fs/fuse/dev_uring.c | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> >> index 7b9822e88..7523569ff 100644
> >> --- a/fs/fuse/dev_uring.c
> >> +++ b/fs/fuse/dev_uring.c
> >> @@ -924,9 +924,7 @@ static int fuse_uring_commit_fetch(struct io_uring=
_cmd *cmd, int issue_flags,
> >>                 pr_info_ratelimited("qid=3D%d commit_id %llu state %d"=
,
> >>                                     queue->qid, commit_id, ent->state)=
;
> >>                 spin_unlock(&queue->lock);
> >> -               req->out.h.error =3D err;
> >> -               clear_bit(FR_SENT, &req->flags);
> >> -               fuse_request_end(req);
> >> +               fuse_uring_req_end(ent, req, err);
> >>                 return err;
> >>         }
> >>
> >
> > Hi Shuvam,
> >
> > There was a similar fix for this submitted a few weeks ago by
> > Zhenghang that was sent offlist to security@kernel.org (which I think
> > was before the announcement came out to cc the public mailing lists
> > when sending fixes to security@). Berkant submitted this fix offlist a
> > few days after that as well. Sorry for the duplicate work.
>
> Out of interest, did you see the entire series I had submitted?

Not sure if you're asking Shuvam or me, but could you post a link to the se=
ries?

Thanks,
Joanne
>
> Thanks,
> Bernd
