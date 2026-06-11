Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D1D3E7BA1
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177829; cv=pass; b=dUOgI0StS1uykHvy9Tb5kxmdrY+nvSi2Yw1fi2/7cExniQjeCPZ9pfhjRiYvuSk8mg08BcxgbuMTWC8QKF2cyZJr3aKqeJWBnXaOF+mT7nSgtCZmX7NeixouYKQkgAIZCT+0yesa/etFTHx3/e0zdWBiOyqLNla/VFjIGF8Tog8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177829; c=relaxed/simple;
	bh=4LZMVz8IVbVmU+1aXtGtaC8SGGzp6xAh935ELk3ODYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVlnpgVNUQ3r8aavV1t++m7NAALjYL4rpTVALA6KwESQEDBKVWy+aOM66A/Edtb9Fl667gF+mBwrsU3uDglp44aTS6CQaJC1volErileCKrX2Q5sJP4yC3CR7phlmCvULY62mIdz7syibJvgS7sUzLS5M/WNHXspUvq9558Mtf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=XwrxWdkS; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="XwrxWdkS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5176ca6bab1so10770981cf.0
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 04:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781177827; cv=none;
        d=google.com; s=arc-20240605;
        b=OZ/DHfXSMIPOIjDq3NJ5LkQ71AGKwFpKniLCIq0XT3gDE0i/dwYqM5a/caUE7DmHjj
         YZWq1P95jKeof1hepF29fDZmW34z08RJbDJ78NY+QtaGTUny+6wx/Bj0oNaTuka1sTWz
         4Kh533nh4X5kkdZe0kJqOe/27BM4TzTzmvno5XOeRInYU3/F/rxUtiV8+Eh34hVqCo0V
         1XtNDrUnANyPa5QGgvGUwrj/L7rXTOPdRSWu5heZYeDX+FLnsRlZ0FZrPD/obVPqfWva
         eEmSk4CegIgDRvUvHHW8hbmIyy83zh6V2CRdccG/ibIQgjMkvwGyrd/qX0rmiAE9rups
         xcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Krbn+MYg+M809YBLBqA3HPhCu/oACb+iPAXWhxNcpGc=;
        fh=z3MT1MBHUa4lgwtYeX9e88DQpncZKWhpz5fLujkHb1A=;
        b=lHEH7XI3z+6+7pBqtqlVZHuDWRdC6R4GjHl7Z0IF/EIW93Sj2her6xQXrrI7heUjlA
         QNy970802UpzkRpf1JDoXtLze/w+TFA3d2nWbSULMXOsMBfKGVaBZSX2+vQlPkpxH69V
         C0DOuQADbKvs2CsWOpstvCjgh94ZoY1msM9e+q3o9TOoJ/971f+sUYJF+E9xoxKNJNvR
         3RPuXiN8k6gBuECXbcbse7R/vSBcF++Le76sD2mgx20hrpVg5hiH0tU2Une5C75GVd4M
         zgHNaOoSR/J13y7NZy9Z6mIP5Un5cDPdi9KXvjvc1tepT6Q8pry2ZlM1s9E0ocwmZudY
         SYJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781177827; x=1781782627; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Krbn+MYg+M809YBLBqA3HPhCu/oACb+iPAXWhxNcpGc=;
        b=XwrxWdkSqqV1uuq4Q8uEAH3l2UijwNVHWruPV66T4vglR5Nz/+VIZ8vsqmwk6BtFky
         kuKm0yL+EI4YxhW6ZlB+ecPe9uprT4ntxHxKp9z/TFUi2Ufp/P9DkFp6CfqdU6FryMfz
         vgaf822r9FOSj0NzGaTgFts6omzFBsz86YtQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177827; x=1781782627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Krbn+MYg+M809YBLBqA3HPhCu/oACb+iPAXWhxNcpGc=;
        b=iFGGjWmE4hX3AKDb1NIO5y4+sb14ujKoMYelKbYVDxjrZkTYwrkCmMiG1hU0PqSeIb
         PzdnhuQNaDUMRB139HrBLSVCMa9EGMLLYDByyLh5XMtvbmWKCyIkTgDzY+jTOkAB7FQE
         FrPQJRYhiIpYGqsh8MEWQsNyJQjXZ5bqk5FanIvmstBSiUgHi6H0w/llq080bWJwe8Fv
         CNuplFb09kc4R5OLrukgnky5R9sUsfAK/kYuBzJReOcCfamQNwfmzF4KMbybXoYHdhM2
         ds/ybo6TdTs4UvsndVmNorHY81Ucy4jLAdw/DyAjWwZbsCuV2OalixRhiB6W8dlHed7w
         CtvA==
X-Forwarded-Encrypted: i=1; AFNElJ9jXnMRl09abg2qA/KFtyErM7LppJjLfp06dTaFlMhL3HnOpGNyTVnqrlq5hTV0yvKHu0jN6DItx38R@lists.linux.dev
X-Gm-Message-State: AOJu0YyL2Tn9Lrd3DlsNFUZHc5xLEjW8Qcf8liCapkoKKaA28PAA7UM0
	uCqVvBlkBhXCMRI/FdH/BiV3sAnyW0vvgRgNF5Fpr6DOTN4za1CBKdwIsGe+/e/Trl3BPrPbSx6
	d3Cjsy4KPbPOnGFRLJ6JvZAWsZMv049pGldI3HwC4cQ==
X-Gm-Gg: Acq92OF4Y2bSIrYzhsDXpsskAlzyuumSA68bXkdHLuH3w6OtyvPMx82DSQAxCXfvt5J
	kuFgYmi/Nw23OW8A5eLkz24F1ARmslbPYeJf6gFe0npgLqLJIXg0ZPCUTeCFOEF87mplydseUhs
	qETDKzVndQ9hiUrcgAz7oXMx5WiEvKAuwvhBAqqUh2/TnTR2eBVZfPU0VKg2KKaqhdthz159gFW
	T7YAOYeNHj8QB8O+j4600OacReAmcRNekeHB+PiUqcBlpYOmm4Pa42TA9wztfVVbZVZDh5ULrsu
	Hi1/941PUYCKrFxv41ziLSG1FQB533/YnZBFHFRmO3uNAWnA+dp3cMRr4yNyFw==
X-Received: by 2002:a05:622a:2c3:b0:50e:600a:638c with SMTP id
 d75a77b69052e-517ef5e438bmr24070671cf.17.1781177827196; Thu, 11 Jun 2026
 04:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <898a4e10-6193-4671-b3b1-7c7bc562a671@fmap.me> <CAOQ4uxjoS-PvnZ2poh0bx0C6ocTYwuEpfV0q5md15SjS620OMg@mail.gmail.com>
 <CAJfpegvxF7F+XKFKokSH4eOgCA0V2RNm6B54MS9nr9wG=U66OA@mail.gmail.com>
 <59ab54f6-680e-456e-91f4-0a26889844ef@fmap.me> <aeFuarTL7xBbut0F@casper.infradead.org>
 <CAJfpegtAeyMRENdneJkJrMKu8Uwnyk9LYBThjvTrFjHmPr6O_g@mail.gmail.com> <9fe5ff50-4c1c-49ee-a8c2-4cacc3c6781d@fmap.me>
In-Reply-To: <9fe5ff50-4c1c-49ee-a8c2-4cacc3c6781d@fmap.me>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Jun 2026 13:36:56 +0200
X-Gm-Features: AVVi8CeK6Z2zBhavJJXwn1vbtJS7ePzzglnt_f4GGpdHii0ALfHsK0WKEmVT6b0
Message-ID: <CAJfpegum=LJTCGqMUfLHehQE19kgdZbE2eXS_002fdpX_sd6jw@mail.gmail.com>
Subject: Re: [fuse-devel] Debugging a stale kernel cache during file growth
To: Nikolay Amiantov <ab@fmap.me>
Cc: Matthew Wilcox <willy@infradead.org>, fuse-devel@lists.sourceforge.net, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	fuse-devel@lists.linux.dev, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 18:49, Nikolay Amiantov <ab@fmap.me> wrote:
>
> Kindly bringing this discussion up.
>
> On 4/17/26 20:48, Miklos Szeredi wrote:
> > Should that code check for a truncated page and retry?
>
> If I understand you correctly, this can be accomplished with a new page
> flag because there's no other way to find out the truncation happened;
> would you say this is the right way forward?
>
> Sadly I didn't have time to try and make a PoC fix yet, but I want to
> try tackle it this weekend; meanwhile, any guidance is appreciated!

Sorry, this got lost in the noise.

I was thinking of something like the below for fixing the invalidation
race (untested, whitespace damaged):

diff --git a/mm/filemap.c b/mm/filemap.c
index 4e636647100c..c9ab0eb35afb 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2856,6 +2856,14 @@ ssize_t filemap_read(struct kiocb *iocb, struct
iov_iter *iter,

                        copied = copy_folio_to_iter(folio, offset, bytes, iter);

+                       /*
+                        * Has the folio been truncated?  In that case we could
+                        * have been copying stale info (including zeroes after
+                        * EOF) for a distributed fs.
+                        */
+                       if (folio->mapping != mapping)
+                               break;
+
                        already_read += copied;
                        iocb->ki_pos += copied;
                        last_pos = iocb->ki_pos;

Thanks,
Miklos
