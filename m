Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0D3BFE34
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 18:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944846; cv=pass; b=F9TvOkvZ3treofmeJoHuDJurviIoUwAzpJMYeenSKts/xZ9wifSEHwWhh2mKvPTtVdOk7OXaaKtIruG4GR1mCma09eT1L32zN945af94qVcLMQCnfUVplXKVR9kbrnfd0Fk5GOScpOkUBX3C9mIcvzS8yistmiuKSYX3eSKI+tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944846; c=relaxed/simple;
	bh=7j/39w5zlEu65/nVwL81VQqiOlCjTXCrIWFh3wNBTKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p63garoQqy/OGBUFk36bnJRGTBmCy6ih3Bz/8BdPpARjUtJKZJfH6wNqcKWkauDgL1dQGaZZqaYMYVcvGPmcNJ0mvc1yr/W5WH1rW4zpZSD4M/FPKIdhDWCRhZ34EsW7UoeUMHbPLTe0SMdI9MGS0GRUUQUmLa+8kip9FgG7Pig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBRMfQ5v; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBRMfQ5v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so3545771f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 11:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780944843; cv=none;
        d=google.com; s=arc-20240605;
        b=HRd7/7Vu09pOZN+58opZLKh/dUolJNNE5BHAgWhP9pX1FhDs236z38aVHxCnfA8bRK
         Gah+9a5hR8bERTeYjb1mAGVa/gDgojOkGzfVkva6Hw6ZFHfzZG+JqjGmtOAmu3SohlxI
         Nrmv4UNur4WZHtuHXt1D6tXgSWLCemNtZTa22ZSPy5ZFbXAOhTlOZK6jt79DN7mOOQPq
         3E8dsDk9Rdr1LMS9shhe5yLRjuE27sGtae3ADadR+SryiMKlx2hmH1NOTfxWoBpdQwYH
         nwSwurmr8t2MgLRbglXRGfrBXkT+iR+WwW9yB0M9gPlQXLRVFJaDuZbVmwKlTseRpmFz
         +9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7j/39w5zlEu65/nVwL81VQqiOlCjTXCrIWFh3wNBTKw=;
        fh=YVZAGNMz9a9GshywUgxb3UtEQ+A/8WOX1pboCON1tA8=;
        b=ckprBgyxytQGHVPPGCuqTLZtgjdkYhuAnxyAsXn0AG6SbiHuUZgnV8OqsaXvw3ZsF3
         HvVenymglmkFxNaI1pUY4+M81Tby+BHwhCAw3afxfvZ+RDCxUil2LeOX9ms9It7x964e
         hkSSVzH7qwj9jl9BWB02xxn/ujbMH/xbB5TBLF1DounHw6R511ZNZjwVDe9SYIpKQnDm
         kC54h4oJs7uWstyXXMwPIjXZr4jDAnSJtg2px/WvwvNlMddHuEpp/jkjlTmmZuglQzIh
         gqdulynY2nHroNaW8ypgDXfpIv12abEu/Ti23u7WL9UsyE2b3uQdNxwuR7425TvYFTzl
         FVyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780944843; x=1781549643; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j/39w5zlEu65/nVwL81VQqiOlCjTXCrIWFh3wNBTKw=;
        b=RBRMfQ5vh3/9hofTBMBRUUKB0Fu9rcUSdFxNW7E/BSsqUDR+XCiOE1Krx22Z7cnhd0
         Wjr5crItgaLOK2t4gcw4X7k49+McZDvpPy/wYvJfeHGdyrsKaoOBuuAxaDmYh/fjCOYq
         M/Mu02/SJ/pvYL4v1tLExEKWEI/le/NLTSi83mPFUYLTxk8mqcZgbG6qJlA5D7Q0ePwM
         KJktkhJN6QskyPRoLscaLsTF0ZBAucyceVo1x0Pb2fojRgtNyN1a3kqnvmjnRIGafIIO
         TWJgn2p1wOVfrAiWRZ6e6dpXsK85rRxPgNVVDlGgZaZfuqOvIxJVl4sfVjxadB+mK2LG
         Osig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780944843; x=1781549643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7j/39w5zlEu65/nVwL81VQqiOlCjTXCrIWFh3wNBTKw=;
        b=gieBfejeo9LlpBLkdPvFGbIK3kynWE7DTF5d/1ldEt+LF/CfW+7YINBZoUsnrYHNFf
         JVicXP55MPbWFK0v51cyAlSbcvA7TzCwls3EWTYXNOhZrmnTwlXFvmjjhI7p0yzy7F+T
         6Z7Ecie9yygC3/0+tV15O+Y3XBQweoGBN1hpg16jJfbnCPQUzMMG8E6P46aSNrOb5w5g
         wuYx6bRpn65pXmxcpmBveEsh9LH7Grlm1gAj15lZzeKa3m8EFx+iQPrEy9MT/Lc1z0iR
         shX6hsRB17UA4YDMG7kzsdKrNiZ6mTeHftkI3WtbusqpeJfU9VZ6D24cxDcdForYWS4I
         QxBw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZBnXtHN9waOZpjgJPLt9rQf0Owjsvtm94ZIltuU0PeI2bMvPKiSnthll9vaRX76w1RUW5h+MARb1/@lists.linux.dev
X-Gm-Message-State: AOJu0YzmlcqIYUxYBOKnlrFVymJrawFdE9wCOQCRA/aGqa0atlJzDehz
	go2GcNYgDFpaym0U4IKn0MY4fekJJmGQ3gF6nAyiek2IxnU958fR/sbYY8NcrxKaOvu70/erMK1
	0sAaK+2HQVRobEkKyfTmbmDSdPCzU23g=
X-Gm-Gg: Acq92OHm/8dAUpM89fjOu6kdcRrm/5OdCR6WKpxVlRFpKraBBw9+RfzUJlzGZB8G20O
	qzxIbV6n2mqfGosO16A4i2i7XocQPZOLwa4hKEj7Tdh3ipv8FDvu24LuH/SSYPxXU4Nh1WrvBbq
	muq3SX9xLz2uKwI9hwugQ/2IAPTrYNcyuXhLuVvWTfVJY1/AbQTusk3yTOvlPTzzQvpTyuvMru5
	3jCeoL/UvGWVoePTkQi0vzhFHF8S5LbcyBtQQk1uxuZQb9F9WiSjjvTXeEtYkfzV+ZQ5WgwX1qm
	gI6IXjjxZCCJbI0B
X-Received: by 2002:a5d:4712:0:b0:441:1e41:194 with SMTP id
 ffacd0b85a97d-460302eca25mr18499330f8f.17.1780944843186; Mon, 08 Jun 2026
 11:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605192708.141921-1-joannelkoong@gmail.com>
 <20260605192708.141921-4-joannelkoong@gmail.com> <058fd2d4-3ba4-46e5-9107-3a7e0ab66653@bsbernd.com>
 <CAJnrk1YHQEtpwA-ForFWXsLntc950ekqAHg=L9VExVfJ2WF1Rw@mail.gmail.com>
 <742e68e6-c456-4655-a441-aaa8267f1a48@bsbernd.com> <CAJnrk1bz=BHryaWkZ0uBCpzLoVM-FSsb4mhA8F7+fnMQ4Tt_YQ@mail.gmail.com>
 <57fdff56-6a4b-4bbd-b191-d63b82a14509@bsbernd.com> <CAJnrk1b4S3EUb-FzrvojC2Lp-DOD1GZEpvEKEMKhPpZbf+sqLQ@mail.gmail.com>
In-Reply-To: <CAJnrk1b4S3EUb-FzrvojC2Lp-DOD1GZEpvEKEMKhPpZbf+sqLQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 11:53:51 -0700
X-Gm-Features: AVVi8CdDFuKrlVaJlTazwHovScoR_I_5UkB_wB_OsNcZsV3y6VrpqIUFwPF_04M
Message-ID: <CAJnrk1akASWprt4VpS6uB63pKqf4WuKq+nTBQ-v75KfLi1Na+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] fuse: end fuse_req on io-uring cancel task work
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, Chris Mason <clm@meta.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:35=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Mon, Jun 8, 2026 at 10:16=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com=
> wrote:
> >
> >
> > On 6/8/26 18:46, Joanne Koong wrote:
> > > On Sat, Jun 6, 2026 at 12:41=E2=80=AFAM Bernd Schubert <bernd@bsbernd=
.com> wrote:
> > >>
> > >>
> > >> I do not think we need 3/3 at all.
> > >
> > > I think this is needed for the cases where tw.cancel occurs without a
> > > subsequent fuse abort, else the application syscall thread is stuck
> > > uninterruptibly in D-state in request_wait_answer() for the
> > > connection's lifetime. tw.cancel with a fuse abort is the common case=
,
> > > but I think unfortunately we also need to handle the case where this
> > > doesn't occur.
> >
> >
> > I see, the initial code was using IO_URING_F_TASK_DEAD and I had wrongl=
y
> > assumed that is related to PF_EXITING.
> > Well, I think the fix is clear, although I personally do not like the
> > exit code dup (or better triple)
> > https://lore.kernel.org/r/20260515045541.1171335-4-joannelkoong@gmail.c=
om
> >
> > In my option fuse_uring_cancel() and canceled fuse_uring_send_in_task()
> > should go through fuse_uring_entry_teardown().
> >
>
> I don't feel strongly about this. On cancel, the ent becomes useless
> since cancel consumes the cmd, so imo it makes sense to just free and
> clean up the ent immediately instead of keeping it around until the
> fuse connection gets eventually aborted, but I don't think it really
> matters. Happy to go with what you prefer.

This fix (as well as [1]) needs to be backported to stable so I think
it'd be better to keep the fix as minimal as possible and do any
entry_teardown deduping as a follow-up cleanup after that. I'll send
out a v2 that fixes it minimally.

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/20260516021138.2759874-4-joannelkoon=
g@gmail.com/

>
> Thanks,
> Joanne
>
> >
> > Thanks,
> > Bernd
